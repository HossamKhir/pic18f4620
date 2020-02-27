#line 1 "E:/embedded_diploma/projects/pic/microwave/hal/src/keypad4x3.c"
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/keypad4x3.h"
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
#line 3 "E:/embedded_diploma/projects/pic/microwave/hal/src/keypad4x3.c"
uint16Ref u16DirectionRowsRef;
uint16Ref u16DirectionColumnsRef;

uint16Ref u16DataRowsRef;
uint16Ref u16DataColumnsRef;

uint8 u8MaskRows;
uint8 u8MaskColumns;










const uint8 u8Keymap[4][3] = {
 { 's', 0, 'h'},
 { 7, 8, 9},
 { 4, 5, 6},
 { 1, 2, 3},
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

  (( ( (*(u16DirectionRowsRef)) ) )=(( ( (*(u16DirectionRowsRef)) ) )|( (u8MaskRows) ))) ;
  (( ( (*(u16DataColumnsRef)) ) )=(( ( (*(u16DataColumnsRef)) ) )|( (u8MaskColumns) ))) ;
  (( ( (*(u16DataRowsRef)) ) )=(( ( (*(u16DataRowsRef)) ) )|( (u8MaskRows) ))) ;
  (( ( (*(u16DirectionRowsRef)) ) )=(( ( (*(u16DirectionRowsRef)) ) )|( (u8MaskRows) ))) ;
  (( ( (*(u16DirectionColumnsRef)) ) )=(( ( (*(u16DirectionColumnsRef)) ) )&(~ (u8MaskColumns) ))) ;
}

uint8
KEYPAD4X3_u8GetKeyPressed(void)
{
 uint8 u8Key = '\0';
 uint8 u8Column = 0;
 uint8 u8RowRead = 0;

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

 return u8Key;
}
