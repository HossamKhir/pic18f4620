#ifndef _UWAVE_UTIL_H_
#define _UWAVE_UTIL_H

#include "data_types.h"
#include "macros.h"

#include "lamp.h"
#include "uwave_heater.h"
#include "uwave_sensors.h"
#include "uwave_motor.h"
#include "uwave_keypad.h"
#include "uwave_display.h"

#define UWAVE_INIT() { \
                         LAMP_INIT(); \
                         UWAVE_HEATER_INIT(); \
                         UWAVE_MOTOR_INIT(UWAVE_MOTOR_MODE,25,10,KHZ);\
                         UWAVE_KEYPAD_INIT(); \
                         UWAVE_SENSORS_INIT();\
                         UWAVE_DISPLAY_INIT(); \
                         TIMERS_vidInitTimer(TIMER0, PRE032, POS01, 250, MSECOND);\
                         TIMERS_vidConfigTimerInterrupts(TIMER0,Pr_High);\
                     }

uint8 UWAVE_UTIL_u8DecrementTime(uint32Ref);
void UWAVE_UTIL_vidScheduler(void);

#endif