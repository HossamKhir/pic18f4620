#include "uwave_sensors.h"

#define UWAVE_SENSOR_DOOR_TOG()     (u8DoorClosed^=0x01);
#define UWAVE_SENSOR_WEIGHT_TOG()   (u8WeightFound^=0x01);

void
UWAVE_SENSORS_vidInit(void)
{
    ADCON1          |=  0X0F;

    u8DoorClosed    =   0x00;
    u8WeightFound   =   0x00;
    
    INTERRUPT_vidInit();
    UWAVE_SENSOR_DOOR_ACTIVATE();
    UWAVE_SENSOR_WEIGHT_ACTIVATE();

    INTERRUPT_CLR_FLAG(INTERRUPT_REG_FLAG_INT1,IntFlag_RB_INT1_TMR1_CCP2);
    INTERRUPT_CLR_FLAG(INTERRUPT_REG_FLAG_INT2,IntFlag_INT0_INT2_TMR2_TMR3);

    INTERRUPT_vidSetPriority(IntPr_INT1_ADC_CM,Pr_Low);
    INTERRUPT_vidSetPriority(IntPr_INT2_PSP_OSCF,Pr_Low);

    INTERRUPT_INT_EDGE_FALLING(EdgeSelExtInt1);
    INTERRUPT_INT_EDGE_FALLING(EdgeSelExtInt2);

    UWAVE_SENSOR_ENABLE_DOOR();
    UWAVE_SENSOR_ENABLE_WEIGHT();
}