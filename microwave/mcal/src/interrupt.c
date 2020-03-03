#include "interrupt.h"

void
INTERRUPT_vidInit(void)
{
    INTERRUPT_ENABLE_GLOBAL();
    INTERRUPT_ENABLE_PERIPHERAL();
    INTERRUPT_ENABLE_PRIORITY();
}

void
INTERRUPT_vidSetPriority(enInterruptPriority interruptSource,enPriority priority)
{
    switch(interruptSource)
    {
        case IntPr_RB:
            INTCON2.RBIP = priority;
        break;
        case IntPr_TMR0:
            INTCON2.TMR0IP = priority;
        break;
        case IntPr_INT1:
            INTCON3.INT1IP = priority;
        break;
        case IntPr_INT2:
            INTCON3.INT2IP = priority;
        break;
    }
}