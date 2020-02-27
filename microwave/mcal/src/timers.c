#include "timers.h"

uint64 u64InitialCount = 0;

// mapping timers to a map of prescalers, prescaler mapping register value to divisor
const unsigned short u16Prescaler[4][9][2] = {
    //{PS1, PS2,    PS4,    PS8,    PS16,   PS32,   PS64,   PS128,      PS256}
    {{0,0}, {0,2}, {1,4}, {2,8}, {3,16},    {4,32}, {5,64}, {6,128},    {7,256}},
    {{0,1}, {1,2}, {2,4}, {3,8}, {0,0},     {0,0},  {0,0},  {0,0},      {0,0}},
    {{0,1}, {0,0}, {1,4}, {0,0}, {2,16},    {0,0},  {0,0},  {0,0},      {0,0}},
    {{0,1}, {1,2}, {2,4}, {3,8}, {0,0},     {0,0},  {0,0},  {0,0},      {0,0}}
};


static void
TIMERS_vidSetPrescale(uint8 u8TimerID, static enum enPrescale prescale)
{
    switch (u8TimerID)
    {
        case TIMER0:
            GET_TMR_CTRL_REG(TIMER0)   |=  (u16Prescaler[u8TimerID][prescale][0] << (4 * (u8TimerID % 2)));
        break;
        case TIMER1:
            GET_TMR_CTRL_REG(TIMER1)   |=  (u16Prescaler[u8TimerID][prescale][0] << (4 * (u8TimerID % 2)));
        break;
        case TIMER2:
            GET_TMR_CTRL_REG(TIMER2)   |=  (u16Prescaler[u8TimerID][prescale][0] << (4 * (u8TimerID % 2)));
        break;
        case TIMER3:
            GET_TMR_CTRL_REG(TIMER3)   |=  (u16Prescaler[u8TimerID][prescale][0] << (4 * (u8TimerID % 2)));
        break;
    }
}

void
TIMERS_vidInitTimer(uint8 u8TimerID,
    const enum enPrescale prescale,
    uint64 u64TargetTime,
    uint64 u64TimeUnit
)
{
    u64TargetTime = GET_TIME_IN_USEC(u64TargetTime,u64TimeUnit);
    TIMERS_vidUpdateInitialCount(u64TargetTime, u8TimerID, prescale);
    TIMERS_vidSetPrescale(u8TimerID, prescale);
    TIMERS_vidResetTimer(u8TimerID);
}

void
TIMERS_vidUpdateInitialCount(uint64 u64TargetTime,
    uint8 u8TimerID,
    static enum enPrescale prescale
)
{
    u64InitialCount = FULL_COUNT - (u64TargetTime / (CYCLE_PERIOD * (double)u16Prescaler[u8TimerID][prescale][1]));
}

void
TIMERS_vidResetTimer(uint8 u8TimerID)
{
    switch (u8TimerID)
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
            TMR2    =   GET_TIME_REG_LOW(u64InitialCount);
            // TMR2H = GET_HIGHER_NIBBLE(u64InitialCount);
            CLR_TMR_INT_FLAG(TIMER2);
        break;
    }
}
