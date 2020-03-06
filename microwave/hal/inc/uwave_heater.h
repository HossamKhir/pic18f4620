#ifndef _UWAVE_HEATER_H_
#define _UWAVE_HEATER_H_

#include "data_types.h"
#include "macros.h"

#define UWAVE_HEATER_DIRECTION_REG  (TRISC)
#define UWAVE_HEATER_DATA_REG       (PORTC)

#define UWAVE_HEATER_MASK           (0x20)
#define UWAVE_HEATER_INDEX          (0x05)

#define UWAVE_HEATER_ON()   \
            (SET_BIT(UWAVE_HEATER_DATA_REG,UWAVE_HEATER_INDEX))
#define UWAVE_HEATER_OFF()  \
            (CLR_BIT(UWAVE_HEATER_DATA_REG,UWAVE_HEATER_INDEX))
#define UWAVE_HEATER_INIT() \
            {   \
                CLR_BITS(UWAVE_HEATER_DIRECTION_REG,UWAVE_HEATER_MASK); \
                UWAVE_HEATER_OFF(); \
            }

#endif /* _UWAVE_HEATER_H_ */
