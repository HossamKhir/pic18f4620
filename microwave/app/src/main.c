#include "main.h"

HeatingTime time;

uint8 u8Index = 0;

void main() {
    // FIXME: testing block
    UWAVE_INIT();
    
    time.u8Seconds = 9;
    
    TIMERS_vidInitTimer(TIMER0, P128, 1, SECOND);
    START_TMR(TIMER0);
    while(1)
    {
        SEGMENT7_vidDisplayDigit(0x20, time.u8Seconds); // 0x00100000
        if(INTCON.TMR0IF)
        {
            UWAVE_UTIL_u8DecrementTime(REF(time));
            TIMERS_vidResetTimer(TIMER0);
            START_TMR(TIMER0);
        }
        /*Delay_ms(1000);
        if(UWAVE_UTIL_u8DecrementTime(REF(time)))
        {
            break;
        }*/
    }
}