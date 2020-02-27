
_main:

;unit02_01_helloWorldLCD.c,87 :: 		void main(){
;unit02_01_helloWorldLCD.c,92 :: 		ADCON1 |= 0X0F;                // Config all ADC's pins as digital
	MOVLW       15
	IORWF       ADCON1+0, 1 
;unit02_01_helloWorldLCD.c,95 :: 		Lcd_Init();                         // Initialize LCD
	CALL        _Lcd_Init+0, 0
;unit02_01_helloWorldLCD.c,99 :: 		Lcd_Cmd(_LCD_CLEAR);                // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;unit02_01_helloWorldLCD.c,100 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);           // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;unit02_01_helloWorldLCD.c,102 :: 		TIMERS_vidInitTimer(TIMER0, P128, 1, SECOND);
	CLRF        FARG_TIMERS_vidInitTimer+0 
	MOVLW       7
	MOVWF       FARG_TIMERS_vidInitTimer+0 
	MOVLW       1
	MOVWF       FARG_TIMERS_vidInitTimer+0 
	MOVLW       0
	MOVWF       FARG_TIMERS_vidInitTimer+1 
	MOVWF       FARG_TIMERS_vidInitTimer+2 
	MOVWF       FARG_TIMERS_vidInitTimer+3 
	MOVLW       64
	MOVWF       FARG_TIMERS_vidInitTimer+0 
	MOVLW       66
	MOVWF       FARG_TIMERS_vidInitTimer+1 
	MOVLW       15
	MOVWF       FARG_TIMERS_vidInitTimer+2 
	MOVLW       0
	MOVWF       FARG_TIMERS_vidInitTimer+3 
	CALL        _TIMERS_vidInitTimer+0, 0
;unit02_01_helloWorldLCD.c,106 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
