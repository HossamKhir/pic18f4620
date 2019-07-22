#include "GPIO.h"

int state[3] = {1,2,3};
int i = 0, j = 0;

void main() {
CLEAR_BIT(TRISC,RC0);
CLEAR_BIT(TRISC,RC1);
SET_BIT(TRISD,RD0);
SET_BIT(TRISD,RD1);
while (1){
/*if (( (PORTD & 0x01) == 0x01) &&
    ( (PORTD & 0x02) == 0x00)){
        SET_BIT(PORTC,RC0);
    }
    else{
        CLEAR_BIT(PORTC,RC0);
    }*/
    if( (PORTD & 0x01) == 0x01){
        for(j = state[i]; j > 0; j-- ){
            SET_BIT(PORTC,RC0);
            Delay_ms(100);
            CLEAR_BIT(PORTC,RC0);
            Delay_ms(100);
            while((PORTD & 0x01) == 0x01);
        }
        if ( i == 2){
            i = 0;
        }
        else{
            i++;
        }
    }
}
}