#include "interrupt.h"

void
INTERRUPT_vidInit(void)
{
    INTERRUPT_ENABLE_GLOBAL();
    INTERRUPT_ENABLE_PERIPHERAL();
    INTERRUPT_ENABLE_PRIORITY();
}

void
INTERRUPT_vidSetPriority(enInterruptPriority interruptSource,
    enPriority priority)
{
    switch(interruptSource)
    {
        case IntPr_RB_TMR1_CCP2:
            INTERRUPT_REG_PR_RB.RBIP = priority;
            INTERRUPT_REG_PR_CCP2.CCP2IP = priority;
        break;
        case IntPr_TMR2_TMR3:
            INTERRUPT_REG_PR_TMR3.TMR3IP = priority;
        break;
        case IntPr_TMR0_CCP1_HLVD:
            INTERRUPT_REG_PR_TMR0.TMR0IP = priority;
            INTERRUPT_REG_PR_HL_VOL_DET.HLVDIP = priority;
        break;
        case IntPr_SSP_BCL:
            INTERRUPT_REG_PR_SSP.SSPIP = priority;
            INTERRUPT_REG_PR_BUS_COL.BCLIP = priority;
        break;
        case IntPr_TX_EE:
            INTERRUPT_REG_PR_TX_RX.TXIP = priority;
            INTERRUPT_REG_PR_EEPROM.EEIP = priority;
        break;
        case IntPr_RX:
            INTERRUPT_REG_PR_TX_RX.RCIP = priority;
        break;
        case IntPr_INT1_ADC_CM:
            INTERRUPT_REG_PR_INT1.INT1IP = priority;
            INTERRUPT_REG_PR_COMPARATOR.CMIP = priority;
        break;
        case IntPr_INT2_PSP_OSCF:
            INTERRUPT_REG_PR_INT2.INT2IP = priority;
            INTERRUPT_REG_PR_OSC_FAIL.OSCFIP = priority;
        break;
    }
}

void ISR_PriorityLow() iv 0x0018 ics ICS_AUTO
{
    // TODO: implement ISRs for low priorities here
    //=============================================
    if (GET_BIT(UWAVE_SENSOR_DOOR_FLAG,FLAG_DOOR))
    {
        u8DoorClosed ^= 1;
    }
    if (GET_BIT(UWAVE_SENSOR_WEIGHT_FLAG,FLAG_WEIGHT))
    {
        u8WeightFound &= 1;
    }
    //=============================================
}

void ISR_PriorityHigh() iv 0x0008 ics ICS_AUTO
{   
    // TODO: implement ISRs for high priorities here
    //==============================================
    if (GET_BIT(INTERRUPT_REG_FLAG_TMR0,IntFlag_TMR0_CCP1_HLVD))
    {
        INTERRUPT_CLR_FLAG(INTERRUPT_REG_FLAG_TMR0,IntFlag_TMR0_CCP1_HLVD);
        FILL_TMR_REGS(TIMER0,u64InitialCount);
        CLR_TMR_INT_FLAG(TIMER0);
        u8OverflowFlag += 1;
    }                                 
    //==============================================        
}