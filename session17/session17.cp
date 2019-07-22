#line 1 "G:/embeddedDiploma/proteusFiles/session17/session17.c"
void main() {
 TRISC &= ~(3 << 0);
 PORTC &= ~(3 << 0);
 TRISD |= (3 << 0);
 while(1)
 {
 if(PORTD == 1)
 {
 PORTC = 1;
 }
 else if(PORTD == 2)
 {
 PORTC = 2;
 }
 else
 {
 PORTC = 0;
 }
 }


}
