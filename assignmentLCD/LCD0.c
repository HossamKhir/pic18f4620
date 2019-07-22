// Lcd pinout settings
sbit LCD_RS at RC4_bit;
sbit LCD_EN at RC5_bit;
sbit LCD_D7 at RC3_bit;
sbit LCD_D6 at RC2_bit;
sbit LCD_D5 at RC1_bit;
sbit LCD_D4 at RC0_bit;

// Pin direction
sbit LCD_RS_Direction at TRISC4_bit;
sbit LCD_EN_Direction at TRISC5_bit;
sbit LCD_D7_Direction at TRISC3_bit;
sbit LCD_D6_Direction at TRISC2_bit;
sbit LCD_D5_Direction at TRISC1_bit;
sbit LCD_D4_Direction at TRISC0_bit;

const char character0[] = {0,0,0,0,0,16,0,0};
const char character1[] = {0,0,0,24,4,20,0,0};
const char character2[] = {0,30,1,25,5,21,0,0};


void CustomChar(char pos_row, char pos_char, const char* arr) {
  char i;
    Lcd_Cmd(64);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(arr[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 0);
}


void main() {
     Lcd_Init();
     Lcd_Cmd(_LCD_CURSOR_OFF);
     while(1){
              CustomChar(1,2,character0);
              Delay_ms(200);
              CustomChar(1,2,character1);
              Delay_ms(200);
              CustomChar(1,2,character2);
              Delay_ms(200);
     }
     

}