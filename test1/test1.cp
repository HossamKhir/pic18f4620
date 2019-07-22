#line 1 "G:/embeddedDiploma/proteusFiles/test1/test1.c"
#line 1 "g:/embeddeddiploma/proteusfiles/test1/gpio.h"








void portc_init(void);
#line 3 "G:/embeddedDiploma/proteusFiles/test1/test1.c"
int state[3] = {1,2,3};
int i = 0, j = 0;

void main() {
 (TRISC &= ~(1<<RC0)) ;
 (TRISC &= ~(1<<RC1)) ;
 (TRISD |= (1<<RD0)) ;
 (TRISD |= (1<<RD1)) ;
while (1){
#line 19 "G:/embeddedDiploma/proteusFiles/test1/test1.c"
 if( (PORTD & 0x01) == 0x01){
 for(j = state[i]; j > 0; j-- ){
  (PORTC |= (1<<RC0)) ;
 Delay_ms(100);
  (PORTC &= ~(1<<RC0)) ;
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
