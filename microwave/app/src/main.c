#include "main.h"

HeatingTime time;

uint8 u8Index = 0x00;
uint8 u8EndFlag = 0;

void main() {
    UWAVE_INIT();

    // FIXME: testing block
    //==========================================================================    
    time.u8Seconds = 3;
    time.u8Minutes = 0;

    PWM_START();
    Delay_ms(5000);
    PWM_HALT();
    
    // TIMERS_vidInitTimer(TIMER0, PRE128, POS01, 10, MSECOND);
    // TIMER_START(TIMER0);
    // while(1)
    // {
    //     if(INTCON.TMR0IF)
    //     {
    //         (!u8EndFlag)? UWAVE_DISPLAY_vidUpdateTimeDisplay(REF(time)) : UWAVE_DISPLAY_vidDisplayEnd();
    //         if (++u8Index == 100)
    //         {
    //             u8Index = 0;
    //             u8EndFlag = UWAVE_UTIL_u8DecrementTime(REF(time));
    //         }
    //         TIMERS_vidResetTimer(TIMER0);
    //         TIMER_START(TIMER0);
    //     }
    // }
    //==========================================================================
}