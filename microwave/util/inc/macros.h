#ifndef _MACROS_H_
#define _MACROS_H_

// setters
#define SET_BIT(REG,INDEX)       (REG|=(1<<INDEX))
#define SET_HIGHER_NIBBLE(REG)   (REG|=0X0F)
#define SET_LOWER_NIBBLE(REG)    (REG|=0XF0)
#define SET_REGISTER_NIBBLE(REG) (REG=0XFF)
#define SET_BITS(REG,MASK)       ((REG)=((REG)|(MASK)))

// getters
#define GET_BIT(REG,INDEX)     ((REG>>INDEX)&0X01)
#define GET_HIGHER_NIBBLE(REG) (REG>>4)
#define GET_LOWER_NIBBLE(REG)  (REG&=0X0F)
#define GET_VAL_REG(REG,MASK)      ((REG)&(MASK))

// clearers
#define CLR_BIT(REG,INDEX)     (REG&=(~(1<<INDEX)))
#define CLR_HIGHER_NIBBLE(REG) (REG&=0X0F)
#define CLR_LOWER_NIBBLE(REG)  (REG&=0XF0)
#define CLR_BITS(REG,MASK)       ((REG)=((REG)&(~MASK)))

// togglers
#define TOG_BIT(REG,INDEX)             ((REG)^=(1<<(INDEX)))

// putters
#define PUT_VAL_HIGHER_NIBBLE(REG,VAL) ((REG)=(((REG)&0X0F)|((VAL)<<4)))
#define PUT_VAL_LOWER_NIBBLE(REG,VAL)  ((REG)=(((REG)&0XF0)|((VAL)&0X0F)))

//
#define REF(PARAM)   (&(PARAM))
#define DEREF(PARAM) (*(PARAM))

#endif
