#include "pwm.h"

void
PWM_vidInit(uint8 u8Mode, uint16 u16DutyCycle)
{
    PWM_SET_MODE(u8Mode);
    
    PWM_SET_DUTY_CYCLE(u16DutyCycle);
    
    //========================================
    // initialise timer2 
    // set timer2 period
    //========================================

    PWM_ACTIVATE();
}
