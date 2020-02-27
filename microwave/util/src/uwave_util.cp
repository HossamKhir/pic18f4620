#line 1 "E:/embedded_diploma/projects/pic/microwave/util/src/uwave_util.c"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/uwave_util.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"



typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned int uint32;
typedef unsigned long uint64;


typedef uint8* uint8Ref;
typedef uint16* uint16Ref;
typedef uint32* uint32Ref;
typedef uint64* uint64Ref;

typedef struct {
 uint8 u8Seconds;
 uint8 u8Minutes;
 uint16 u16TimeDisplay;
}HeatingTime;

typedef HeatingTime* HeatingTimeRef;
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/lamp.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/uwave_heater.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/uwave_sensors.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 9 "e:/embedded_diploma/projects/pic/microwave/hal/inc/uwave_sensors.h"
void UWAVE_SENSORS_vidInit(void);
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/uwave_motor.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/pwm.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/timers.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 56 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/timers.h"
const enum enPrescale {
 P1,
 P2,
 P4,
 P8,
 P16,
 P32,
 P64,
 P128,
 P256
};

void TIMERS_vidInitTimer(uint8, const enum enPrescale, uint64, uint64);
void TIMERS_vidUpdateInitialCount(uint64 , uint8, static enum enPrescale);
void TIMERS_vidResetTimer(uint8 );
#line 34 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/pwm.h"
const enum PWM_MODE{
 CHDH = 0x0C,
 CHDL,
 CLDH,
 CLDL
};

void PWM_vidInit(uint8 u8Mode, uint16 u16DutyCycle);
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/uwave_keypad.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/keypad4x3.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/segment7.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 9 "e:/embedded_diploma/projects/pic/microwave/hal/inc/segment7.h"
void SEGMENT7_vidInit(uint16Ref, uint16Ref, uint16Ref, uint16Ref, uint8);
void SEGMENT7_vidDisplayDigit(uint8, uint8);
#line 8 "e:/embedded_diploma/projects/pic/microwave/hal/inc/keypad4x3.h"
void KEYPAD4X3_vidInit(uint16Ref, uint16Ref, uint16Ref, uint16Ref, uint8,
 uint8);

uint8 KEYPAD4X3_u8GetKeyPressed(void);
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/uwave_display.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/segment7.h"
#line 26 "e:/embedded_diploma/projects/pic/microwave/hal/inc/uwave_display.h"
void UWAVE_DISPLAY_vidUpdateTimeDisplay(HeatingTimeRef);
#line 23 "e:/embedded_diploma/projects/pic/microwave/util/inc/uwave_util.h"
void UWAVE_UTIL_vidUpdateTime(HeatingTimeRef);
void UWAVE_UTIL_vidSetTime(HeatingTimeRef);
uint8 UWAVE_UTIL_u8DecrementTime(HeatingTimeRef);
#line 3 "E:/embedded_diploma/projects/pic/microwave/util/src/uwave_util.c"
void
UWAVE_UTIL_vidUpdateTime(HeatingTimeRef timeout)
{
 timeout->u8Seconds = timeout->u16TimeDisplay % 100;
 timeout->u8Minutes = timeout->u16TimeDisplay / 100;
}

void
UWAVE_UTIL_vidSetTime(HeatingTimeRef timeout, uint16 u16Time)
{
 timeout->u16TimeDisplay = u16Time % 10000;
 UWAVE_UTIL_vidUpdateTime(timeout);
}


uint8
UWAVE_UTIL_u8DecrementTime(HeatingTimeRef timeoutRef)
{
 if (timeoutRef->u8Seconds == 0)
 {
 if (timeoutRef->u8Minutes > 0)
 {
 timeoutRef->u8Minutes -= 1;
 timeoutRef->u8Seconds = 59;
 }
 else
 {
 return 1;
 }
 }
 else
 {
 timeoutRef->u8Seconds -= 1;
 }
 return 0;
}
