#line 1 "E:/embedded_diploma/projects/pic/microwave/mcal/src/pwm.c"
#line 1 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/pwm.h"
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
#line 3 "E:/embedded_diploma/projects/pic/microwave/mcal/src/pwm.c"
void
PWM_vidInit(uint8 u8Mode, uint16 u16DutyCycle)
{
  ( (( (CCP1CON) )=((( (CCP1CON) )&0XF0)|((u8Mode)&0X0F))) ) ;

  { (( ( (CCP1CON) ) )=(( ( (CCP1CON) ) )|( ((((u16DutyCycle)>>4))&( (0x30) )) ))) ; (CCPR1L) = (((u16DutyCycle))&( (0xFF) )) ; } ;






  ( ( (TRISC) &=(~(1<< (0x02) ))) ) ;
}
