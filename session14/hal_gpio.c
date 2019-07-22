#include "hal_gpio.h"

void port_io_init(uint16_t *ptr, uint8_t pin, uint8_t state){
    if(state == 0){        //output
        CLEAR_BIT(*ptr, pin);
    }
    else{                  //input
        SET_BIT(*ptr, pin);
    }
}
void port_on_iff_init(uint16_t *ptr, uint8_t pin, uint8_t state){
    if(state == 0){        //off
        CLEAR_BIT(*ptr, pin);
    }
    else{                  //on
        SET_BIT(*ptr, pin);
    }
}