#line 1 "E:/embedded_diploma/projects/pic/microwave/mcal/src/pwm.c"
#line 1 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/pwm.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"



typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned int uint32;
typedef unsigned long uint64;

typedef enum {
 IntEn_TMR1_CCP2,
 IntEn_TMR2_TMR3,
 IntEn_CCP1_HLVD,
 IntEn_RB_INT1_SSP_BCL,
 IntEn_INT0_INT2_TX_EE,
 IntEn_TMR0_RX,
 IntEn_PEIE_ADC_CM,
 IntEn_GIE_PSP_OSCF
} enInterruptEnable;

typedef enum {
 IntFlag_RB_INT1_TMR1_CCP2,
 IntFlag_INT0_INT2_TMR2_TMR3,
 IntFlag_TMR0_CCP1_HLVD,
 IntFlag_SSP_BCL,
 IntFlag_TX_EE,
 IntFlag_RX,
 IntFlag_ADC_CM,
 IntFlag_PSP_OSCF
} enInterruptFlag;

typedef enum {
 IntPr_RB_TMR1_CCP2,
 IntPr_TMR2_TMR3,
 IntPr_TMR0_CCP1_HLVD,
 IntPr_SSP_BCL,
 IntPr_TX_EE,
 IntPr_RX,
 IntPr_INT1_ADC_CM,
 IntPr_INT2_PSP_OSCF
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

typedef enum {
 STATE_IDLE,
 STATE_HEAT
} enStateMachine;

typedef uint8* uint8Ref;
typedef uint16* uint16Ref;
typedef uint32* uint32Ref;
typedef uint64* uint64Ref;
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/timers.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/interrupt.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/uwave_util.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/lamp.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/uwave_heater.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/uwave_sensors.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/interrupt.h"
#line 42 "e:/embedded_diploma/projects/pic/microwave/hal/inc/uwave_sensors.h"
extern uint8 u8DoorClosed;
extern uint8 u8WeightFound;

void UWAVE_SENSORS_vidInit(void);
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/uwave_motor.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/pwm.h"
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
void SEGMENT7_vidDisplayFigure(uint8, uint8);
#line 8 "e:/embedded_diploma/projects/pic/microwave/hal/inc/keypad4x3.h"
void KEYPAD4X3_vidInit(uint16Ref, uint16Ref, uint16Ref, uint16Ref, uint8,
 uint8);
uint8 KEYPAD4X3_u8GetKeyPressed(void);
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/uwave_display.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/segment7.h"
#line 31 "e:/embedded_diploma/projects/pic/microwave/hal/inc/uwave_display.h"
void UWAVE_DISPLAY_vidUpdateTimeDisplay(uint32);
void UWAVE_DISPLAY_vidDisplayEnd(void);
#line 25 "e:/embedded_diploma/projects/pic/microwave/util/inc/uwave_util.h"
uint8 UWAVE_UTIL_u8DecrementTime(uint32Ref);
void UWAVE_UTIL_vidScheduler(void);
#line 93 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/interrupt.h"
extern uint8 u8OverflowFlag;
extern uint64 u64InitialCount;

void INTERRUPT_vidInit(void);
void INTERRUPT_vidSetPriority(enInterruptPriority,enPriority);
#line 52 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/timers.h"
void TIMERS_vidInitTimer(enTimer, enPrescale, enPostscale, uint64, uint64);
void TIMERS_vidUpdateInitialCount(uint64 , enTimer, enPrescale, enPostscale);
void TIMERS_vidResetTimer(enTimer);
void TIMERS_vidConfigTimerInterrupts(enTimer, enPriority);
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
