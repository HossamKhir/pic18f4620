#line 1 "E:/embedded_diploma/projects/pic/assignmentLCD/LCD.c"

sbit LCD_RS at RC4_bit;
sbit LCD_EN at RC5_bit;
sbit LCD_D7 at RC3_bit;
sbit LCD_D6 at RC2_bit;
sbit LCD_D5 at RC1_bit;
sbit LCD_D4 at RC0_bit;


sbit LCD_RS_Direction at TRISC4_bit;
sbit LCD_EN_Direction at TRISC5_bit;
sbit LCD_D7_Direction at TRISC3_bit;
sbit LCD_D6_Direction at TRISC2_bit;
sbit LCD_D5_Direction at TRISC1_bit;
sbit LCD_D4_Direction at TRISC0_bit;

int col = 0;

void main() {
 TRISC =~ (63 << 0);
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 while (1){
 for (col = 1; col <= 12; col+=2 ){
 Lcd_Out(1,col,"Ahmed");
 Delay_ms(200);
 Lcd_Out(1,col,"     ");
 Lcd_Out(2,col+1,"Ahmed");
 Delay_ms(200);
 Lcd_Out(2,col+1,"     ");
 }
 }
}
