#ifndef _PWM_H_
#define _PWM_H_

#include "data_types.h"
#include "macros.h"
#include "timers.h"

#define HERTZ                   (1UL)
#define KHZ                     (1000UL)
#define MHZ                     (1000000UL)

#define PWM_REG_DIR             (TRISC)
#define PWM_REG_MODE            (CCP1CON)
#define PWM_REG_DUTY_CYCLE_HIGH (CCPR1L)
#define PWM_REG_DUTY_CYCLE_LOW  (PWM_REG_MODE)

#define PWM_OUT_PIN_MASK        (0x02)
#define PWM_DUTY_CYCLE_MASK_MSB (0xFF)
#define PWM_DUTY_CYCLE_MASK_LSB (0x30)

#define PWM_SET_MODE(MODE)  (PUT_VAL_LOWER_NIBBLE(PWM_REG_MODE,MODE))
#define PWM_GET_DUTY_CYCLE_MSB(DUTY_CYCLE)  \
            GET_VAL_REG((DUTY_CYCLE>>2),PWM_DUTY_CYCLE_MASK_MSB)
#define PWM_GET_DUTY_CYCLE_LSB(DUTY_CYCLE)  \
            GET_VAL_REG((DUTY_CYCLE<<4),PWM_DUTY_CYCLE_MASK_LSB)
#define PWM_SET_DUTY_CYCLE_LSB(DUTY_CYCLE)  \
            SET_BITS(PWM_REG_DUTY_CYCLE_LOW,PWM_GET_DUTY_CYCLE_MSB(DUTY_CYCLE))
#define PWM_SET_DUTY_CYCLE_MSB(DUTY_CYCLE)  \
            PWM_REG_DUTY_CYCLE_HIGH=PWM_GET_DUTY_CYCLE_MSB(DUTY_CYCLE)
#define PWM_SET_DUTY_CYCLE(DUTY_CYCLE)  { \
                                            PWM_SET_DUTY_CYCLE_MSB(DUTY_CYCLE); \
                                            PWM_SET_DUTY_CYCLE_LSB(DUTY_CYCLE); \
                                        }

#define PWM_ACTIVATE()      (CLR_BIT(PWM_REG_DIR,PWM_OUT_PIN_MASK))
#define PWM_DEACTIVATE()    (SET_BIT(PWM_REG_DIR,PWM_OUT_PIN_MASK))
#define PWM_START()         (TIMER_START(TIMER2))
#define PWM_HALT()          (TIMER_HALT(TIMER2))

void PWM_vidInit(enPWMMode, uint16, uint64, uint64);

#endif /* _PWM_H_ */
