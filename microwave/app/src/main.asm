
_main:

;main.c,39 :: 		void main() {
;main.c,42 :: 		unsigned char u8Index = 0;
	CLRF        main_u8Index_L0+0 
;main.c,44 :: 		SEGMENT7_vidInit(MICROWAVE_REGISTER_DISPLAY_SELECT,
	MOVLW       TRISD+0
	MOVWF       FARG_SEGMENT7_vidInit+0 
	MOVLW       hi_addr(TRISD+0)
	MOVWF       FARG_SEGMENT7_vidInit+1 
;main.c,45 :: 		MICROWAVE_REGISTER_DISPLAY_DATA,
	MOVLW       TRISA+0
	MOVWF       FARG_SEGMENT7_vidInit+0 
	MOVLW       hi_addr(TRISA+0)
	MOVWF       FARG_SEGMENT7_vidInit+1 
;main.c,46 :: 		MICROWAVE_DISPLAY,
	MOVLW       PORTD+0
	MOVWF       FARG_SEGMENT7_vidInit+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_SEGMENT7_vidInit+1 
;main.c,47 :: 		MICROWAVE_DISPLAY_SELECT,
	MOVLW       PORTA+0
	MOVWF       FARG_SEGMENT7_vidInit+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_SEGMENT7_vidInit+1 
;main.c,48 :: 		MASK_MICROWAVE_DISPLAY_SELECT);
	MOVLW       195
	MOVWF       FARG_SEGMENT7_vidInit+0 
	CALL        _SEGMENT7_vidInit+0, 0
;main.c,50 :: 		time.seconds = 10;
	MOVLW       10
	MOVWF       _time+0 
;main.c,52 :: 		*MICROWAVE_REGISTER_LAMP &= ~(0xff);
	MOVLW       0
	ANDWF       TRISB+0, 1 
;main.c,53 :: 		*MICROWAVE_LAMP &= ~(0xFF);
	MOVLW       0
	ANDWF       PORTB+0, 1 
;main.c,55 :: 		while(time.seconds >= 0)
L_main0:
	MOVLW       0
	SUBWF       _time+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main1
;main.c,57 :: 		for (u8Index = 0; u8Index < 200; u8Index += 1)
	CLRF        main_u8Index_L0+0 
L_main2:
	MOVLW       200
	SUBWF       main_u8Index_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;main.c,59 :: 		SEGMENT7_vidDisplayDigit(MASK_SECONDS_UNITS,
	MOVLW       32
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
;main.c,60 :: 		numbers[(time.seconds % 10)]);
	MOVLW       10
	MOVWF       R4 
	MOVF        _time+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       _numbers+0
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_numbers+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_numbers+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_SEGMENT7_vidDisplayDigit+0
	CALL        _SEGMENT7_vidDisplayDigit+0, 0
;main.c,62 :: 		Delay_us(2500);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
;main.c,64 :: 		SEGMENT7_vidDisplayDigit(MASK_SECONDS_TENS,
	MOVLW       16
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
;main.c,65 :: 		numbers[(time.seconds / 10)]);
	MOVLW       10
	MOVWF       R4 
	MOVF        _time+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVLW       _numbers+0
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_numbers+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_numbers+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_SEGMENT7_vidDisplayDigit+0
	CALL        _SEGMENT7_vidDisplayDigit+0, 0
;main.c,67 :: 		Delay_us(2500);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
;main.c,57 :: 		for (u8Index = 0; u8Index < 200; u8Index += 1)
	INCF        main_u8Index_L0+0, 1 
;main.c,68 :: 		}
	GOTO        L_main2
L_main3:
;main.c,70 :: 		*MICROWAVE_LAMP ^= MASK_LAMP;
	BTG         PORTB+0, 4 
;main.c,72 :: 		time.seconds -= 1;
	DECF        _time+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _time+0 
;main.c,73 :: 		}
	GOTO        L_main0
L_main1:
;main.c,74 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
