#ifndef _GPIO_H
#define _GPIO_H
#define SET_BIT(REG,BIT) (REG |= (1<<BIT))
#define CLEAR_BIT(REG,BIT) (REG &= ~(1<<BIT))
#define TOGGLE_BIT(REG,BIT) (REG ^= (1<<BIT))
#define SET_REG(REG) (REG |= (255<<0))
#define CLEAR_REG(REG) (REG &= ~(255<<0)))
#define TOGGLE_REG(REG) (REG ^= (255<<0)))
void portc_init(void);
#endif