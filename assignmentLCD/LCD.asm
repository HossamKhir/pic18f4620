
_main:

;LCD.c,19 :: 		void main() {
;LCD.c,20 :: 		TRISC =~ (63 << 0);
	MOVLW       192
	MOVWF       TRISC+0 
;LCD.c,21 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;LCD.c,22 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LCD.c,23 :: 		while (1){
L_main0:
;LCD.c,24 :: 		for (col = 1; col <= 12; col+=2 ){
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
L_main2:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _col+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main8
	MOVF        _col+0, 0 
	SUBLW       12
L__main8:
	BTFSS       STATUS+0, 0 
	GOTO        L_main3
;LCD.c,25 :: 		Lcd_Out(1,col,"Ahmed");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_LCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_LCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD.c,26 :: 		Delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
;LCD.c,27 :: 		Lcd_Out(1,col,"     ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_LCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_LCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD.c,28 :: 		Lcd_Out(2,col+1,"Ahmed");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVF        _col+0, 0 
	ADDLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_LCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_LCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD.c,29 :: 		Delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
;LCD.c,30 :: 		Lcd_Out(2,col+1,"     ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVF        _col+0, 0 
	ADDLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_LCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_LCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD.c,24 :: 		for (col = 1; col <= 12; col+=2 ){
	MOVLW       2
	ADDWF       _col+0, 1 
	MOVLW       0
	ADDWFC      _col+1, 1 
;LCD.c,31 :: 		}
	GOTO        L_main2
L_main3:
;LCD.c,32 :: 		}
	GOTO        L_main0
;LCD.c,33 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
