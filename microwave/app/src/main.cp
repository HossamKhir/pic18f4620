#line 1 "E:/embedded_diploma/projects/pic/microwave/app/src/main.c"
#line 1 "e:/embedded_diploma/projects/pic/microwave/hal/inc/segment7.h"





void SEGMENT7_vidInit(unsigned short*, unsigned short*, unsigned short*, unsigned short*, unsigned char);
void SEGMENT7_vidDisplayDigit(unsigned char, unsigned char);
#line 21 "E:/embedded_diploma/projects/pic/microwave/app/src/main.c"
const char numbers[10] = { 0b00111111,
 0b00000110,
 0b01011011,
 0b01001111,
 0b01100110,
 0b01101101,
 0b01111101,
 0b00000111,
 0b01111111,
 0b01101111
 };

struct Time {
 unsigned char seconds;
 unsigned char minutes;
} time;


void main() {


 unsigned char u8Index = 0;

 SEGMENT7_vidInit( (&TRISD) ,
  (&TRISA) ,
  (&PORTD) ,
  (&PORTA) ,
  ~(0x3C) );

 time.seconds = 10;

 * (&TRISB)  &= ~(0xff);
 * (&PORTB)  &= ~(0xFF);

 while(time.seconds >= 0)
 {
 for (u8Index = 0; u8Index < 200; u8Index += 1)
 {
 SEGMENT7_vidDisplayDigit( (0x20) ,
 numbers[(time.seconds % 10)]);

 Delay_us(2500);

 SEGMENT7_vidDisplayDigit( (0x10) ,
 numbers[(time.seconds / 10)]);

 Delay_us(2500);
 }

 * (&PORTB)  ^=  (0x10) ;

 time.seconds -= 1;
 }
}
