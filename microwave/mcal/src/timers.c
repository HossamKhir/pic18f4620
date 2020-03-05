#include "timers.h"

uint64 u64InitialCount = 0;

// mapping timers to a map of prescalers, prescaler mapping register value to divisor
const uint16 u16Prescaler[4][9][2] = {
    //{PS1, PS2,    PS4,    PS8,    PS16,   PS32,   PS64,   PS128,      PS256}
    {{0,0}, {0,2}, {1,4}, {2,8}, {3,16},    {4,32}, {5,64}, {6,128},    {7,256}},
    {{0,1}, {1,2}, {2,4}, {3,8}, {0,0},     {0,0},  {0,0},  {0,0},      {0,0}},
    {{0,1}, {0,0}, {1,4}, {0,0}, {2,16},    {0,0},  {0,0},  {0,0},      {0,0}},
    {{0,1}, {1,2}, {2,4}, {3,8}, {0,0},     {0,0},  {0,0},  {0,0},      {0,0}}
};

static void
TIMERS_vidSetScale(enTimer timerID,
    enPrescale prescale,
    enPostscale postscale)
{
    switch (timerID)
    {
        case TIMER0:
            GET_TMR_CTRL_REG(TIMER0)   |=  (u16Prescaler[timerID][prescale][0] << (4 * (timerID % 2)));
        break;
        case TIMER1:
            GET_TMR_CTRL_REG(TIMER1)   |=  (u16Prescaler[timerID][prescale][0] << (4 * (timerID % 2)));
        break;
        case TIMER2:
            GET_TMR_CTRL_REG(TIMER2)   |=  (u16Prescaler[timerID][prescale][0] << (4 * (timerID % 2)));
            GET_TMR_CTRL_REG(TIMER2)    |=  (postscale << 3);
        break;
        case TIMER3:
            GET_TMR_CTRL_REG(TIMER3)   |=  (u16Prescaler[timerID][prescale][0] << (4 * (timerID % 2)));
        break;
    }
}

void
TIMERS_vidInitTimer(enTimer timerID,
    enPrescale prescale,
    enPostscale postscale,
    uint64 u64TargetTime,
    uint64 u64TimeUnit
)
{
    u64TargetTime = GET_TIME_IN_USEC(u64TargetTime,u64TimeUnit);
    TIMERS_vidUpdateInitialCount(u64TargetTime, timerID, prescale, postscale);
    TIMERS_vidSetScale(timerID, prescale, postscale);
    TIMERS_vidResetTimer(timerID);
}

void
TIMERS_vidUpdateInitialCount(uint64 u64TargetTime,
    enTimer timerID,
    enPrescale prescale,
    enPostscale postscale
)
{
    switch (timerID)
    {
        case TIMER0:
        case TIMER1:
        case TIMER3:
            u64InitialCount = (FULL_COUNT + 1) - (uint64)(u64TargetTime / (CYCLE_PERIOD * (double)u16Prescaler[timerID][prescale][1]));
        break;
        case TIMER2:
            u64InitialCount = (uint64)(u64TargetTime / (CYCLE_PERIOD * (double)u16Prescaler[timerID][prescale][1] * (postscale + 1)));
        break;
    }
}

void
TIMERS_vidResetTimer(enTimer timerID)
{
    switch (timerID)
    {
        case TIMER0:
            FILL_TMR_REGS(TIMER0,u64InitialCount);
            CLR_TMR_INT_FLAG(TIMER0);
        break;
        case TIMER1:
            FILL_TMR_REGS(TIMER1,u64InitialCount);
            CLR_TMR_INT_FLAG(TIMER1);
        break;
        case TIMER3:
            FILL_TMR_REGS(TIMER3,u64InitialCount);
            CLR_TMR_INT_FLAG(TIMER3);
        break;
        case TIMER2:
            // FIXME: timer 2 has no high & low, but period & register
            PR2 =   GET_TIME_REG_LOW(u64InitialCount);
            CLR_TMR_INT_FLAG(TIMER2);
        break;
    }
}

void
TIMERS_vidConfigTimerInterrupts(enTimer timerID, enPriority priority)
{
    INTERRUPT_vidInit();

    switch(timerID)
    {
        case TIMER0:
            INTERRUPT_CLR_FLAG(INTERRUPT_REG_FLAG_TMR0,IntFlag_TMR0_CCP1_HLVD);
            INTERRUPT_vidSetPriority(IntPr_TMR0_CCP1_HLVD, priority);
            INTERRUPT_ENABLE_SRC(INTERRUPT_REG_EN_TMR0,IntEn_TMR0_RX);
        break;
        case TIMER1:
            INTERRUPT_CLR_FLAG(INTERRUPT_REG_FLAG_TMR1_TMR2,IntFlag_RB_INT1_TMR1_CCP2);
            INTERRUPT_vidSetPriority(IntPr_RB_TMR1_CCP2, priority);
            INTERRUPT_ENABLE_SRC(INTERRUPT_REG_EN_TMR1_TMR2,IntEn_TMR1_CCP2);
        break;
        case TIMER2:
            INTERRUPT_CLR_FLAG(INTERRUPT_REG_FLAG_TMR1_TMR2,IntFlag_INT0_INT2_TMR2_TMR3);
            INTERRUPT_vidSetPriority(IntPr_TMR2_TMR3, priority);
            INTERRUPT_ENABLE_SRC(INTERRUPT_REG_EN_TMR1_TMR2,IntEn_TMR2_TMR3);
        break;
        case TIMER3:
            INTERRUPT_CLR_FLAG(INTERRUPT_REG_FLAG_TMR3,IntFlag_INT0_INT2_TMR2_TMR3);
            INTERRUPT_vidSetPriority(IntPr_TMR2_TMR3, priority);
            INTERRUPT_ENABLE_SRC(INTERRUPT_REG_EN_TMR3,IntEn_TMR2_TMR3);
        break;
    }
}