#line 1 "E:/embedded_diploma/projects/pic/microwave/hal/src/uwave_display.c"
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/uwave_display.h"
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
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/segment7.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 9 "e:/embedded_diploma/projects/pic/microwave/hal/inc/segment7.h"
void SEGMENT7_vidInit(uint16Ref, uint16Ref, uint16Ref, uint16Ref, uint8);
void SEGMENT7_vidDisplayDigit(uint8, uint8);
void SEGMENT7_vidDisplayFigure(uint8, uint8);
#line 31 "e:/embedded_diploma/projects/pic/microwave/hal/inc/uwave_display.h"
void UWAVE_DISPLAY_vidUpdateTimeDisplay(uint32);
void UWAVE_DISPLAY_vidDisplayEnd(void);
#line 3 "E:/embedded_diploma/projects/pic/microwave/hal/src/uwave_display.c"
static uint8 u8SecondsUnits = 0;
static uint8 u8SecondsTens = 0;
static uint8 u8MinutesUnits = 0;
static uint8 u8MinutesTens = 0;

static uint8 u8CurrentCursor = 0;



static void
vidGetTimeDigits(uint32 u32Time)
{
 u8MinutesTens = u32Time / 1000;
 u8MinutesUnits = (u32Time % 1000) / 100;
 u8SecondsTens = (u32Time % 100) / 10;
 u8SecondsUnits = (u32Time % 100) % 10;
}

void
UWAVE_DISPLAY_vidUpdateTimeDisplay(uint32 u32Time)
{

 vidGetTimeDigits(u32Time);

 switch (u8CurrentCursor)
 {
 case 0:
 SEGMENT7_vidDisplayDigit( (0x20) , u8SecondsUnits);
 break;
 case 1:
 SEGMENT7_vidDisplayDigit( (0x10) , u8SecondsTens);
 break;
 case 2:
 SEGMENT7_vidDisplayDigit( (0x08) , u8MinutesUnits);
 break;
 case 3:
 SEGMENT7_vidDisplayDigit( (0x04) , u8MinutesTens);
 break;
 }

 u8CurrentCursor = (u8CurrentCursor <  (((u32Time)/1000)?3:((u32Time)/100)?2:((u32Time)/10)?1:0) )? (u8CurrentCursor + 1) : 0;
}

void
UWAVE_DISPLAY_vidDisplayEnd(void)
{

 switch (u8CurrentCursor++)
 {
 case 0:
 SEGMENT7_vidDisplayFigure( (0x08) ,  (0x86) );
 break;
 case 1:
 SEGMENT7_vidDisplayFigure( (0x10) ,  (0xAB) );
 break;
 case 2:
 SEGMENT7_vidDisplayFigure( (0x20) ,  (0xA1) );
 break;
 default:
 u8CurrentCursor = 0;
 }
}
