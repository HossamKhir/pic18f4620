#line 1 "E:/embedded_diploma/projects/pic/microwave/hal/src/segment7.c"
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/segment7.h"
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
#line 9 "e:/embedded_diploma/projects/pic/microwave/hal/inc/segment7.h"
void SEGMENT7_vidInit(uint16Ref, uint16Ref, uint16Ref, uint16Ref, uint8);
void SEGMENT7_vidDisplayDigit(uint8, uint8);
void SEGMENT7_vidDisplayFigure(uint8, uint8);
#line 3 "E:/embedded_diploma/projects/pic/microwave/hal/src/segment7.c"
uint16Ref u16DirectionDisplayDataRef;
uint16Ref u16DirectionDisplaySelectRef;

uint16Ref u16RegisterDisplayDataRef;
uint16Ref u16RegisterDisplaySelectRef;

const char u8Numbers[10] = {
 0b11000000,
 0b11111001,
 0b10100100,
 0b10110000,
 0b10011001,
 0b10010010,
 0b10000010,
 0b11111000,
 0b10000000,
 0b10010000
 };









void
SEGMENT7_vidInit(uint16Ref u16RegisterSegmentSelectDirectionRef,
 uint16Ref u16RegisterSegmentDataDirectionRef,
 uint16Ref u16RegisterSegmentSelectRef,
 uint16Ref u16RegisterSegmentDataRef,
 uint8 u8SelectionMask)
{
 ADCON1 |= 0X0F;

 u16DirectionDisplayDataRef = u16RegisterSegmentDataDirectionRef;
 u16DirectionDisplaySelectRef = u16RegisterSegmentSelectDirectionRef;

 u16RegisterDisplayDataRef = u16RegisterSegmentDataRef;
 u16RegisterDisplaySelectRef = u16RegisterSegmentSelectRef;

  ( (*(u16DirectionDisplaySelectRef)) )  &= u8SelectionMask;
  ( ( (*(u16DirectionDisplayDataRef)) )  &= (~(0b011111111)) ) ;
}

void
SEGMENT7_vidDisplayDigit(uint8 u8DisplaySelected,
 uint8 u8Digit)
{
  ( ( (*(u16DirectionDisplayDataRef)) )  &= (~(0b011111111)) ) ;
  ( (*(u16RegisterDisplaySelectRef)) )  = u8DisplaySelected;

  ( (*(u16RegisterDisplayDataRef)) )  = ~u8Numbers[u8Digit];
  ( ( (*(u16DirectionDisplayDataRef)) )  &= ~ (~(0b011111111)) ) ;
}

void
SEGMENT7_vidDisplayFigure(uint8 u8DisplaySelected,
 uint8 u8Figure)
{
  ( ( (*(u16DirectionDisplayDataRef)) )  &= (~(0b011111111)) ) ;
  ( (*(u16RegisterDisplaySelectRef)) )  = u8DisplaySelected;

  ( (*(u16RegisterDisplayDataRef)) )  = ~u8Figure;
  ( ( (*(u16DirectionDisplayDataRef)) )  &= ~ (~(0b011111111)) ) ;
}
