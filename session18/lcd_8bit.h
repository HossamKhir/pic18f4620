#ifndef _LCD_8BIT_H
#define _LCD_8BIT_H

#define LCD_RS RC0_bit
#define LCD_EN RC1_bit
#define LCD_RS_DIR TRISC0_bit
#define LCD_EN_DIR TRISC1_bit
#define LCD_DATA PORTD
#define LCD_DATA_DIR TRISD

void lcd_enable(void);
void lcd_send_command(char command);
void lcd_send_data(char Data);
void Lcd_Init(void);

#endif