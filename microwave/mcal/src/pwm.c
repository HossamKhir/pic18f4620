#include "pwm.h"

void
PWM_vidInit(enPWMMode pwmmode,
    uint16 u16DutyCycle,
    uint64 u64PWMFreq,
    uint64 u64FreqUnit)
{
    PWM_SET_MODE(pwmmode);
    
    // FIXME: should find workaround hard coded scalers
    u16DutyCycle = (uint16)((u16DutyCycle / 100.0) * (FOSC / (double)(PRE004 * POS01 * (u64PWMFreq * u64FreqUnit))));
    PWM_SET_DUTY_CYCLE(u16DutyCycle);
    
    TIMERS_vidInitTimer(TIMER2, PRE004, POS01, ((uint64)(1.0 / u64PWMFreq)), u64FreqUnit);
    
    PWM_ACTIVATE();
    PWM_HALT();
}