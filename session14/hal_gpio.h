#ifndef _HAL_GPIO_H
#define _HAL_GPIO_H

#include "ral_gpio.h"

#define PINC0 0
#define PINC1 1
#define PINC2 2
#define PINC3 3
#define PINC4 4
#define PINC5 5
#define PINC6 6
#define PINC7 7

#define ON 1
#define INPUT 1
#define OFF 0
#define OUTPUT 0

#define CLEAR_BIT(REG,BIT) (REG &= ~(1<<BIT))
#define SET_BIT(REG,BIT) (REG |= (1<<BIT))
#define TOGGLE_BIT(REG,BIT) (REG ^= (1<<BIT))

void port_on_iff_init(uint16_t *ptr, uint8_t pin, uint8_t state);
void port_io_init(uint16_t *ptr, uint8_t pin, uint8_t state);

#endif