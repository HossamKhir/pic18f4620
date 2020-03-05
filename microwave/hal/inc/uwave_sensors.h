#ifndef _UWAVE_SENSORS_H_
#define _UWAVE_SENSORS_H_

#include "data_types.h"
#include "macros.h"
#include "interrupt.h"

#define UWAVE_SENSORS_PUREG         (INTERRUPT_REG_EN_RBPU)
#define UWAVE_SENSORS_PUBIT         (INTERRUPT_RBPU_BIT)
#define UWAVE_SENSOR_DOOR           (INTERRUPT_REG_EN_INT1)
#define UWAVE_SENSOR_WEIGHT         (INTERRUPT_REG_EN_INT2)

#define UWAVE_SENSOR_DOOR_FLAG      (INTERRUPT_REG_FLAG_INT1)
#define UWAVE_SENSOR_WEIGHT_FLAG    (INTERRUPT_REG_FLAG_INT2)

#define FLAG_DOOR                   (IntFlag_RB_INT1_TMR1_CCP2)
#define FLAG_WEIGHT                 (IntFlag_INT0_INT2_TMR2_TMR3)

#define UWAVE_SENSORS_INIT()                UWAVE_SENSORS_vidInit()
#define UWAVE_SENSORS_PUR_ENABLE()          CLR_BIT(UWAVE_SENSORS_PUREG,UWAVE_SENSORS_PUBIT)
#define UWAVE_SENSORS_PUR_DISABLE()         SET_BIT(UWAVE_SENSORS_PUREG,UWAVE_SENSORS_PUBIT)

#define UWAVE_SENSOR_DOOR_ACTIVATE()        INTERRUPT_INT1_ACTIVATE()
#define UWAVE_SENSOR_DOOR_DEACTIVATE()      INTERRUPT_INT1_DEACTIVATE()

#define UWAVE_SENSOR_WEIGHT_ACTIVATE()      INTERRUPT_INT2_ACTIVATE()
#define UWAVE_SENSOR_WEIGHT_DEACTIVATE()    INTERRUPT_INT2_DEACTIVATE()

#define UWAVE_SENSORS_ACTIVATE()            { \
                                                UWAVE_SENSOR_DOOR_ACTIVATE(); \
                                                UWAVE_SENSOR_WEIGHT_ACTIVATE(); \
                                            }

#define UWAVE_SENSORS_DEACTIVATE()          { \
                                                UWAVE_SENSOR_DOOR_DEACTIVATE(); \
                                                UWAVE_SENSOR_WEIGHT_DEACTIVATE(); \
                                            }

#define UWAVE_SENSOR_ENABLE_DOOR()          INTERRUPT_ENABLE_SRC(UWAVE_SENSOR_DOOR,IntEn_RB_INT1_SSP_BCL)
#define UWAVE_SENSOR_ENABLE_WEIGHT()        INTERRUPT_ENABLE_SRC(UWAVE_SENSOR_WEIGHT,IntEn_INT0_INT2_TX_EE)

extern uint8 u8DoorClosed;
extern uint8 u8WeightFound;

void UWAVE_SENSORS_vidInit(void);

#endif /* _UWAVE_SENSORS_H_ */