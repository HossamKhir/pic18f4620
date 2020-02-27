#ifndef _LAMP_H
#define _LAMP_H

#define LAMP_DIRECTION  (TRISB)
#define LAMP_DATA       (PORTB)
#define LAMP_MASK       (0x80)
#define LAMP_INDEX      (0x07)

#define LAMP_INIT()     { \
                            CLR_BITS(LAMP_DIRECTION,LAMP_MASK); \
                            CLR_BITS(LAMP_DATA,LAMP_MASK); \
                        }
        
#define LAMP_ON()       (SET_BITS(LAMP_DATA,LAMP_MASK))
#define LAMP_OFF()      (CLR_BITS(LAMP_DATA,LAMP_MASK))
#define LAMP_TOG()      (TOG_BIT(LAMP_DATA,LAMP_INDEX))

#endif
