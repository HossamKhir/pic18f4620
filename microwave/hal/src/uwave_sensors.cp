#line 1 "E:/embedded_diploma/projects/pic/microwave/hal/src/uwave_sensors.c"
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/uwave_sensors.h"
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
#line 9 "e:/embedded_diploma/projects/pic/microwave/hal/inc/uwave_sensors.h"
void UWAVE_SENSORS_vidInit(void);
#line 3 "E:/embedded_diploma/projects/pic/microwave/hal/src/uwave_sensors.c"
static uint8 u8DoorClosed = 0x00;
static uint8 u8WeightFound = 0x00;




void
UWAVE_SENSORS_vidInit(void)
{
 u8DoorClosed=0x00;
 u8WeightFound=0x00;
}
