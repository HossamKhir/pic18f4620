#ifndef _UWAVE_MOTOR_H_
#define _UWAVE_MOTOR_H_

#include "data_types.h"
#include "macros.h"
#include "pwm.h"

#define UWAVE_MOTOR_MODE    (0x0C)

// TODO: implement initialisation function
#define UWAVE_MOTOR_INIT(MODE,D_CYCLE,PWM_FREQ,FREQ_UNIT)  PWM_vidInit((MODE),(D_CYCLE),(PWM_FREQ),(FREQ_UNIT))

#endif /* _UWAVE_MOTOR_H_ */
