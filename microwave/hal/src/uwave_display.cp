#line 1 "E:/embedded_diploma/projects/pic/microwave/hal/src/uwave_display.c"
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/uwave_display.h"
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
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/segment7.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 9 "e:/embedded_diploma/projects/pic/microwave/hal/inc/segment7.h"
void SEGMENT7_vidInit(uint16Ref, uint16Ref, uint16Ref, uint16Ref, uint8);
void SEGMENT7_vidDisplayDigit(uint8, uint8);
#line 26 "e:/embedded_diploma/projects/pic/microwave/hal/inc/uwave_display.h"
void UWAVE_DISPLAY_vidUpdateTimeDisplay(HeatingTimeRef);
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

 vidGetTimeDigits(timeoutRef);

 SEGMENT7_vidDisplayDigit( (0x20) , u8SecondsUnits);
 Delay_us(1250);
 SEGMENT7_vidDisplayDigit( (0x10) , u8SecondsTens);
 Delay_us(1250);
 SEGMENT7_vidDisplayDigit( (0x08) , u8MinutesUnits);
 Delay_us(1250);
 SEGMENT7_vidDisplayDigit( (0x04) , u8MinutesTens);
 Delay_us(1250);
}
