#line 1 "G:/embeddedDiploma/proteusFiles/session15/sevenSegment.c"
int second = 0, minute = 0, hour = 0, i;

void main() {
 TRISC &= ~(15 << 0);
 PORTC &= ~(15 << 0);
 TRISD &= ~(63 << 0);
 PORTD &= ~(63 << 0);
 while (1)
 {
 for (i = 0; i <= 50; i++)
 {
 PORTD = 1;
 PORTC = second % 10;
 Delay_us(3333);
 PORTD = 2;
 PORTC = second /10;
 Delay_us(3333);
 PORTD = 4;
 PORTC = minute % 10;
 Delay_us(3333);
 PORTD = 8;
 PORTC = minute /10;
 Delay_us(3333);
 PORTD = 16;
 PORTC = hour % 10;
 Delay_us(3333);
 PORTD = 32;
 PORTC = hour /10;
 Delay_us(3333);
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
