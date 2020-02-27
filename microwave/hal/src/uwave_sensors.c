#include "uwave_sensors.h"

static uint8 u8DoorClosed   = 0x00;
static uint8 u8WeightFound  = 0x00;

#define UWAVE_DOOR_SENSOR_TOG()     (u8DoorClosed^=0x01);
#define UWAVE_WEIGHT_FOUND_TOG()    (u8WeightFound^=0x01);

void
UWAVE_SENSORS_vidInit(void)
{
    u8DoorClosed=0x00;
    u8WeightFound=0x00;
}
