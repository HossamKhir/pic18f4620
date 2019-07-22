#ifndef _RAL_GPIO_H
#define _RAL_GPIO_H

#include "sys_types.h"

#define REG_TRISC_PTR (volatile uint16_t *) 0xF94
#define REG_PORTC_PTR (volatile uint16_t *) 0xF82

#define REG_TRISC *(REG_TRISC_PTR)
#define REG_PORTC *(REG_PORTC_PTR)

#endif