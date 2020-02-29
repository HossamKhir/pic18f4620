#line 1 "E:/embedded_diploma/projects/pic/microwave/hal/src/segment7.c"
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/segment7.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"



typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned int uint32;
typedef unsigned long uint64;

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
  ( (*(u16RegisterDisplaySelectRef)) )  = u8DisplaySelected;

  ( (*(u16RegisterDisplayDataRef)) )  = ~u8Numbers[u8Digit];
}

void
SEGMENT7_vidDisplayFigure(uint8 u8DisplaySelected,
 uint8 u8Figure)
{
  ( (*(u16RegisterDisplaySelectRef)) )  = u8DisplaySelected;

  ( (*(u16RegisterDisplayDataRef)) )  = ~u8Figure;
}
