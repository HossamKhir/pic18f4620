#line 1 "E:/embedded_diploma/projects/pic/microwave/mcal/src/interrupt.c"
#line 1 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/interrupt.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"



typedef unsigned char uint8;
typedef unsigned int uint16;
typedef unsigned long uint32;
typedef unsigned long long uint64;

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
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/timers.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/interrupt.h"
#line 52 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/timers.h"
void TIMERS_vidInitTimer(enTimer, enPrescale, enPostscale, uint64, uint64);
void TIMERS_vidUpdateInitialCount(uint64 , enTimer, enPrescale, enPostscale);
void TIMERS_vidResetTimer(enTimer);
void TIMERS_vidConfigTimerInterrupts(enTimer, enPriority);
#line 40 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/pwm.h"
void PWM_vidInit(enPWMMode, uint16, uint64, uint64);
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
void UWAVE_DISPLAY_vidUpdateTimeDisplay(uint16);
void UWAVE_DISPLAY_vidDisplayEnd(void);
#line 55 "e:/embedded_diploma/projects/pic/microwave/util/inc/uwave_util.h"
uint8 UWAVE_UTIL_u8DecrementTime(uint16Ref);
void UWAVE_UTIL_vidScheduler(void);
#line 93 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/interrupt.h"
extern uint8 u8OverflowFlag;
extern uint32 u64InitialCount;

void INTERRUPT_vidInit(void);
void INTERRUPT_vidSetPriority(enInterruptPriority,enPriority);
#line 3 "E:/embedded_diploma/projects/pic/microwave/mcal/src/interrupt.c"
void
INTERRUPT_vidInit(void)
{
  ( (INTCON) |=(1<<IntEn_GIE_PSP_OSCF)) ;
  ( (INTCON) |=(1<<IntEn_PEIE_ADC_CM)) ;
  ( (RCON) |=(1<<IntEn_GIE_PSP_OSCF)) ;
}

void
INTERRUPT_vidSetPriority(enInterruptPriority interruptSource,
 enPriority priority)
{
 switch(interruptSource)
 {
 case IntPr_RB_TMR1_CCP2:
  (INTCON2) .RBIP = priority;
  (IPR2) .CCP2IP = priority;
 break;
 case IntPr_TMR2_TMR3:
  (IPR2) .TMR3IP = priority;
 break;
 case IntPr_TMR0_CCP1_HLVD:
  (INTCON2) .TMR0IP = priority;
  (IPR2) .HLVDIP = priority;
 break;
 case IntPr_SSP_BCL:
  (IPR1) .SSPIP = priority;
  (IPR2) .BCLIP = priority;
 break;
 case IntPr_TX_EE:
  (IPR1) .TXIP = priority;
  (IPR2) .EEIP = priority;
 break;
 case IntPr_RX:
  (IPR1) .RCIP = priority;
 break;
 case IntPr_INT1_ADC_CM:
  (INTCON3) .INT1IP = priority;
  (IPR2) .CMIP = priority;
 break;
 case IntPr_INT2_PSP_OSCF:
  (INTCON3) .INT2IP = priority;
  (IPR2) .OSCFIP = priority;
 break;
 }
}

void ISR_PriorityLow() iv 0x0018 ics ICS_AUTO
{


 if ( (( ( (INTCON3) ) >> (IntFlag_RB_INT1_TMR1_CCP2) )&0X01) )
 {
 u8DoorClosed ^= 1;
 }
 if ( (( ( (INTCON3) ) >> (IntFlag_INT0_INT2_TMR2_TMR3) )&0X01) )
 {
 u8WeightFound &= 1;
 }

}

void ISR_PriorityHigh() iv 0x0008 ics ICS_AUTO
{


 if ( (( (INTCON) >>IntFlag_TMR0_CCP1_HLVD)&0X01) )
 {
  ((INTCON)&=(~(1<<IntFlag_TMR0_CCP1_HLVD))) ;
  { TMR0L = (((u64InitialCount))&0xFF) ; TMR0H = ( ((((u64InitialCount))>>8)&0xFF) ) ; } ;
  (INTCON. TMR0IF =0) ;
 u8OverflowFlag += 1;
 }

}
