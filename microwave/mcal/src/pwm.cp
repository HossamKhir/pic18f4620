#line 1 "E:/embedded_diploma/projects/pic/microwave/mcal/src/pwm.c"
#line 1 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/pwm.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"



typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned int uint32;
typedef unsigned long uint64;

typedef enum {
 IntFlag_RB_INT1,
 IntFlag_INT0_INT2,
 IntFlag_TMR0
} enInterruptFlag;

typedef enum {
 IntEn_RB_INT1 = 3,
 IntEn_INT0_INT2,
 IntEn_TMR0,
 IntEn_PEIE,
 IntEn_GIE
} enInterruptEnable;

typedef enum {
 IntPr_RB,
 IntPr_TMR0 = 2,
 IntPr_INT1 = 6,
 IntPr_INT2
} enInterruptPriority;

typedef enum {
 Pr_Low,
 Pr_High
} enPriority;

typedef enum {
 EdgeSelExtInt2 = 4,
 EdgeSelExtInt1,
 EdgeSelExtInt0
} enExtIntEdgeSelect;

typedef enum {
 TIMER0,
 TIMER1,
 TIMER2,
 TIMER3
} enTimer;

typedef enum {
 PRE001,
 PRE002,
 PRE004,
 PRE008,
 PRE016,
 PRE032,
 PRE064,
 PRE128,
 PRE256
} enPrescale;

typedef enum {
 POS01,
 POS02,
 POS03,
 POS04,
 POS05,
 POS06,
 POS07,
 POS08,
 POS09,
 POS10,
 POS11,
 POS12,
 POS13,
 POS14,
 POS15,
 POS16
} enPostscale;

typedef enum {
 CHDH = 0x0C,
 CHDL,
 CLDH,
 CLDL
} enPWMMode;

typedef struct {
 uint8 u8Seconds;
 uint8 u8Minutes;
 uint16 u16TimeDisplay;
}HeatingTime;

typedef uint8* uint8Ref;
typedef uint16* uint16Ref;
typedef uint32* uint32Ref;
typedef uint64* uint64Ref;

typedef HeatingTime* HeatingTimeRef;
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/timers.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/interrupt.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 44 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/interrupt.h"
void INTERRUPT_vidInit(void);
void INTERRUPT_vidSetPriority(enInterruptPriority,enPriority);
#line 52 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/timers.h"
void TIMERS_vidInitTimer(enTimer, enPrescale, enPostscale, uint64, uint64);
void TIMERS_vidUpdateInitialCount(uint64 , enTimer, enPrescale, enPostscale);
void TIMERS_vidResetTimer(uint8);
#line 40 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/pwm.h"
void PWM_vidInit(enPWMMode, uint16, uint64, uint64);
#line 3 "E:/embedded_diploma/projects/pic/microwave/mcal/src/pwm.c"
void
PWM_vidInit(enPWMMode pwmmode,
 uint16 u16DutyCycle,
 uint64 u64PWMFreq,
 uint64 u64FreqUnit)
{
  ( (( (CCP1CON) )=((( (CCP1CON) )&0XF0)|((pwmmode)&0X0F))) ) ;


 u16DutyCycle = (uint16)((u16DutyCycle / 100.0) * ( 8000000UL  / (double)(PRE004 * POS01 * (u64PWMFreq * u64FreqUnit))));
  { (CCPR1L) = (((u16DutyCycle>>2))&( (0xFF) )) ; (( ( (CCP1CON) ) )=(( ( (CCP1CON) ) )|( (((u16DutyCycle>>2))&( (0xFF) )) ))) ; } ;

 TIMERS_vidInitTimer(TIMER2, PRE004, POS01, ((uint64)(1.0 / u64PWMFreq)), u64FreqUnit);

  ( ( (TRISC) &=(~(1<< (0x02) ))) ) ;
  ( ( T2CON . TMR2ON =0) ) ;
}
