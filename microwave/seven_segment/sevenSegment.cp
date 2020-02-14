#line 1 "E:/embedded_diploma/projects/pic/microwave/seven_segment/sevenSegment.c"
#line 1 "e:/embedded_diploma/projects/pic/microwave/seven_segment/segment7.h"



 void SEGMENT7_vidInit(int*, int*, char);
#line 3 "E:/embedded_diploma/projects/pic/microwave/seven_segment/sevenSegment.c"
int second = 0, minute = 0, hour = 0, i;

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

void main() {
#line 26 "E:/embedded_diploma/projects/pic/microwave/seven_segment/sevenSegment.c"
 SEGMENT7_vidInit(&TRISD, &TRISA, ~(0x3C));

 while (1)
 {
 for (i = 0; i <= 50; i++)
 {
 PORTA = 32;
 PORTD = numbers[second % 10];
 Delay_us(3333);
 PORTA = 16;
 PORTD = numbers[second /10];
 Delay_us(3333);
 PORTA = 8;
 PORTD = numbers[minute % 10];
 Delay_us(3333);
 PORTA = 4;
 PORTD = numbers[minute /10];
 Delay_us(3333);
#line 50 "E:/embedded_diploma/projects/pic/microwave/seven_segment/sevenSegment.c"
 }

 second++;
 if (second == 60)
 {
 second = 0;
 minute++;
 }
 if (minute == 60)
 {
 minute = 0;
 hour++;
 }
 if (hour == 24)
 {
 hour = 0;
 }
 }

}
