#ifndef _LCD_4BIT_H
#define _LCD_4BIT_H

#define LCD_RS RC0_bit
#define LCD_EN RC1_bit
#define LCD_RS_DIR TRISC0_bit
#define LCD_EN_DIR TRISC1_bit
#define LCD_DATA0 RC4_bit
#define LCD_DATA1 RC5_bit
#define LCD_DATA2 RC6_bit
#define LCD_DATA3 RC7_bit
#define LCD_DATA_DIR0 TRISC4_bit
#define LCD_DATA_DIR1 TRISC5_bit
#define LCD_DATA_DIR2 TRISC6_bit
#define LCD_DATA_DIR3 TRISC7_bit

void lcd_enable(void);
void lcd_send_command(char command);
void lcd_send_data(char Data);
void Lcd_Init(void);
void lcdOutCP(char *text);
void lcdChrCP(char text);
void lcdCmd(char command);
void lcdSetCursor(char row, char col);
void lcdOut(char row, char col, char *text);
void lcdChr(char row, char col, char text);

#endif