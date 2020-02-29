#line 1 "E:/embedded_diploma/projects/pic/microwave/hal/src/uwave_display.c"
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/uwave_display.h"
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
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/segment7.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 9 "e:/embedded_diploma/projects/pic/microwave/hal/inc/segment7.h"
void SEGMENT7_vidInit(uint16Ref, uint16Ref, uint16Ref, uint16Ref, uint8);
void SEGMENT7_vidDisplayDigit(uint8, uint8);
void SEGMENT7_vidDisplayFigure(uint8, uint8);
#line 30 "e:/embedded_diploma/projects/pic/microwave/hal/inc/uwave_display.h"
void UWAVE_DISPLAY_vidUpdateTimeDisplay(HeatingTimeRef);
void UWAVE_DISPLAY_vidDisplayEnd(void);
#line 3 "E:/embedded_diploma/projects/pic/microwave/hal/src/uwave_display.c"
uint8 u8SecondsUnits = 0;
uint8 u8SecondsTens = 0;
uint8 u8MinutesUnits = 0;
uint8 u8MinutesTens = 0;

static void
vidGetTimeDigits(HeatingTimeRef timeoutRef)
{
 u8SecondsUnits = (timeoutRef->u8Seconds) % 10;
 u8SecondsTens = (timeoutRef->u8Seconds) / 10;
 u8MinutesUnits = (timeoutRef->u8Minutes) % 10;
 u8MinutesTens = (timeoutRef->u8Minutes) / 10;
}

void
UWAVE_DISPLAY_vidUpdateTimeDisplay(HeatingTimeRef timeoutRef)
{
 static uint8 u8CurrentCursor = 0;

 vidGetTimeDigits(timeoutRef);

 switch (u8CurrentCursor++)
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
 default:
 u8CurrentCursor = 0;
 }

}

void
UWAVE_DISPLAY_vidDisplayEnd(void)
{
 static char u8CurrentCursor = 0;

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
