#line 1 "E:/embedded_diploma/projects/pic/microwave/hal/src/keypad4x3.c"
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/keypad4x3.h"
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
#line 8 "e:/embedded_diploma/projects/pic/microwave/hal/inc/keypad4x3.h"
void KEYPAD4X3_vidInit(uint16Ref, uint16Ref, uint16Ref, uint16Ref, uint8,
 uint8);
uint8 KEYPAD4X3_u8GetKeyPressed(void);
#line 3 "E:/embedded_diploma/projects/pic/microwave/hal/src/keypad4x3.c"
uint16Ref u16DirectionRowsRef;
uint16Ref u16DirectionColumnsRef;

uint16Ref u16DataRowsRef;
uint16Ref u16DataColumnsRef;

uint8 u8MaskRows;
uint8 u8MaskColumns;
#line 38 "E:/embedded_diploma/projects/pic/microwave/hal/src/keypad4x3.c"
const uint8 u8Keymap[4][3] = {
 { 's', '0', 'h'},
 { '7', '8', '9'},
 { '4', '5', '6'},
 { '1', '2', '3'},
};

void
KEYPAD4X3_vidInit(uint16Ref u16RowsDirectionRef,
 uint16Ref u16ColumnsDirectionRef,
 uint16Ref u16RowsDataRef,
 uint16Ref u16ColumnsDataRef,
 uint8 u8RowsMask,
 uint8 u8ColumnsMask)
{
 ADCON1 |= 0X0F;

 u16DirectionRowsRef = u16RowsDirectionRef;
 u16DirectionColumnsRef = u16ColumnsDirectionRef;
 u16DataRowsRef = u16RowsDataRef;
 u16DataColumnsRef = u16ColumnsDataRef;

 u8MaskRows = u8RowsMask;
 u8MaskColumns = u8ColumnsMask;

  { (( ( (*(u16DirectionRowsRef)) ) )=(( ( (*(u16DirectionRowsRef)) ) )|( (u8MaskRows) ))) ; (( ( (*(u16DataColumnsRef)) ) )=(( ( (*(u16DataColumnsRef)) ) )|( (u8MaskColumns) ))) ; (( ( (*(u16DataRowsRef)) ) )=(( ( (*(u16DataRowsRef)) ) )|( (u8MaskRows) ))) ; (( ( (*(u16DirectionRowsRef)) ) )=(( ( (*(u16DirectionRowsRef)) ) )|( (u8MaskRows) ))) ; (( ( (*(u16DirectionColumnsRef)) ) )=(( ( (*(u16DirectionColumnsRef)) ) )&(~ (u8MaskColumns) ))) ; } ;
}

uint8
KEYPAD4X3_u8GetKeyPressed(void)
{
 static uint8 u8Pressed = '\0';
 uint8 u8Key = '\0';
 uint8 u8Column = 0;
 uint8 u8RowRead = 0;

  { (( ( (*(u16DirectionRowsRef)) ) )=(( ( (*(u16DirectionRowsRef)) ) )|( (u8MaskRows) ))) ; (( ( (*(u16DataColumnsRef)) ) )=(( ( (*(u16DataColumnsRef)) ) )|( (u8MaskColumns) ))) ; (( ( (*(u16DataRowsRef)) ) )=(( ( (*(u16DataRowsRef)) ) )|( (u8MaskRows) ))) ; (( ( (*(u16DirectionRowsRef)) ) )=(( ( (*(u16DirectionRowsRef)) ) )|( (u8MaskRows) ))) ; (( ( (*(u16DirectionColumnsRef)) ) )=(( ( (*(u16DirectionColumnsRef)) ) )&(~ (u8MaskColumns) ))) ; } ;

  (( ( (*(u16DataColumnsRef)) ) )=(( ( (*(u16DataColumnsRef)) ) )|( (u8MaskColumns) ))) ;

 for (u8Column = 0; u8Column < 3; u8Column += 1)
 {
  ( ( (*(u16DataColumnsRef)) ) &=(~(1<<u8Column))) ;

 u8RowRead =  (( ( (*(u16DataRowsRef)) ) )&( (u8MaskRows) )) ;

 if (u8RowRead !=  (u8MaskRows) )
 {
 break;
 }
 else
 {
  ( ( (*(u16DataColumnsRef)) ) |=(1<<u8Column)) ;
 }
 }

  { (( ( (*(u16DirectionRowsRef)) ) )=(( ( (*(u16DirectionRowsRef)) ) )&(~ (u8MaskRows) ))) ; (( ( (*(u16DataColumnsRef)) ) )=(( ( (*(u16DataColumnsRef)) ) )&(~ (u8MaskColumns) ))) ; (( ( (*(u16DataRowsRef)) ) )=(( ( (*(u16DataRowsRef)) ) )&(~ (u8MaskRows) ))) ; (( ( (*(u16DirectionRowsRef)) ) )=(( ( (*(u16DirectionRowsRef)) ) )&(~ (u8MaskRows) ))) ; (( ( (*(u16DirectionColumnsRef)) ) )=(( ( (*(u16DirectionColumnsRef)) ) )|( (u8MaskColumns) ))) ; } ;

 if (u8Column != 3)
 {
 switch(u8RowRead)
 {
 case 0x0E:
 u8Key = u8Keymap[0][u8Column];
 break;
 case 0x0D:
 u8Key = u8Keymap[1][u8Column];
 break;
 case 0x0B:
 u8Key = u8Keymap[2][u8Column];
 break;
 case 0x07:
 u8Key = u8Keymap[3][u8Column];
 break;
 default:
 u8Key = u8Key;
 }
 }

 if ((u8Pressed) && (u8Pressed != u8Key))
 {

 u8Column = u8Pressed;
 u8Pressed = u8Key;
 u8Key = u8Column;
 }
 else if ((!u8Pressed) && u8Key)
 {

 u8Pressed = u8Key;
 return '\0';
 }
 else if (u8Pressed == u8Key)
 {

 return '\0';
 }
 else
 {

 return u8Key;
 }
}
