#ifndef _PWM_H_
#define _PWM_H_

#include "data_types.h"
#include "macros.h"
#include "timers.h"

#define PWM_OUT_REG                 (TRISC)
#define PWM_MODE_REG                (CCP1CON)
#define PWM_DUTY_CYCLE_LOW_REG      (CCPR1L)
#define PWM_DUTY_CYCLE_HIGH_REG     (PWM_MODE_REG)

#define PWM_OUT_PIN_MASK            (0x02)
#define PWM_DUTY_CYCLE_LSB_MASK     (0xFF)
#define PWM_DUTY_CYCLE_MSB_MASK     (0x30)

#define PWM_SET_MODE(MODE)  (PUT_VAL_LOWER_NIBBLE(PWM_MODE_REG,MODE))
#define PWM_GET_DUTY_CYCLE_LSB(DUTY_CYCLE)  \
            GET_VAL_REG((DUTY_CYCLE),PWM_DUTY_CYCLE_LSB_MASK)
#define PWM_GET_DUTY_CYCLE_MSB(DUTY_CYCLE)  \
            GET_VAL_REG(((DUTY_CYCLE)>>4),PWM_DUTY_CYCLE_MSB_MASK)
#define PWM_SET_DUTY_CYCLE_LSB(DUTY_CYCLE)  \
            PWM_DUTY_CYCLE_LOW_REG=PWM_GET_DUTY_CYCLE_LSB(DUTY_CYCLE)
#define PWM_SET_DUTY_CYCLE_MSB(DUTY_CYCLE)  \
            SET_BITS(PWM_DUTY_CYCLE_HIGH_REG,PWM_GET_DUTY_CYCLE_MSB(DUTY_CYCLE))
#define PWM_SET_DUTY_CYCLE(DUTY_CYCLE)  { \
                                            PWM_SET_DUTY_CYCLE_MSB(DUTY_CYCLE); \
                                            PWM_SET_DUTY_CYCLE_LSB(DUTY_CYCLE); \
                                        }

#define PWM_ACTIVATE()              (CLR_BIT(PWM_OUT_REG,PWM_OUT_PIN_MASK))
#define PWM_DEACTIVATE()            (SET_BIT(PWM_OUT_REG,PWM_OUT_PIN_MASK))

const enum PWM_MODE{
    CHDH = 0x0C,
    CHDL,
    CLDH,
    CLDL
};

void PWM_vidInit(uint8 u8Mode, uint16 u16DutyCycle);


#endif /* _PWM_H_ */
