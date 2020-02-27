#line 1 "E:/embedded_diploma/projects/pic/microwave/app/src/main.c"
#line 1 "e:/embedded_diploma/projects/pic/microwave/app/inc/main.h"
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
#line 3 "E:/embedded_diploma/projects/pic/microwave/app/src/main.c"
HeatingTime time;

uint8 u8Index = 0;

void main() {

  { { (( (TRISB) )=(( (TRISB) )&(~ (0x80) ))) ; (( (PORTB) )=(( (PORTB) )&(~ (0x80) ))) ; } ; { (( (TRISC) )=(( (TRISC) )&(~ (0x20) ))) ; ( ( (PORTC) &=(~(1<< (0x05) ))) ) ; } ; UWAVE_SENSORS_vidInit() ; ( (0x0C) ) ; { KEYPAD4X3_vidInit( ( (&(TRISD)) ) , ( (&(TRISB)) ) , ( (&(PORTD)) ) , ( (&(PORTB)) ) , (0x0F) , (0x07) ); } ; SEGMENT7_vidInit( ( (&(TRISA)) ) , ( (&(TRISD)) ) , ( (&(PORTA)) ) , ( (&(PORTD)) ) , (~(0x3C)) ); ; } ;

 time.u8Seconds = 9;

 TIMERS_vidInitTimer( 0 , P128, 1,  1000000 );
  ( T0CON . TMR0ON =1) ;
 while(1)
 {
 SEGMENT7_vidDisplayDigit(0x20, time.u8Seconds);
 if(INTCON.TMR0IF)
 {
 UWAVE_UTIL_u8DecrementTime( (&(time)) );
 TIMERS_vidResetTimer( 0 );
  ( T0CON . TMR0ON =1) ;
 }
#line 29 "E:/embedded_diploma/projects/pic/microwave/app/src/main.c"
 }
}
