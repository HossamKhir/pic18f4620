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
                         UWAVE_SENSORS_INIT();\
                         UWAVE_MOTOR_INIT();\
                         UWAVE_KEYPAD_INIT(); \
                         UWAVE_DISPLAY_INIT(); \
                     }

void    UWAVE_UTIL_vidUpdateTime(HeatingTimeRef);
void    UWAVE_UTIL_vidSetTime(HeatingTimeRef);
uint8   UWAVE_UTIL_u8DecrementTime(HeatingTimeRef);

#endif