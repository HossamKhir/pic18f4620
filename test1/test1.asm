
_main:

;test1.c,6 :: 		void main() {
;test1.c,7 :: 		CLEAR_BIT(TRISC,RC0);
	BCF         TRISC+0, 0 
;test1.c,8 :: 		CLEAR_BIT(TRISC,RC1);
	BCF         TRISC+0, 1 
;test1.c,9 :: 		SET_BIT(TRISD,RD0);
	BSF         TRISD+0, 0 
;test1.c,10 :: 		SET_BIT(TRISD,RD1);
	BSF         TRISD+0, 1 
;test1.c,11 :: 		while (1){
L_main0:
;test1.c,19 :: 		if( (PORTD & 0x01) == 0x01){
	MOVLW       1
	ANDWF       PORTD+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
;test1.c,20 :: 		for(j = state[i]; j > 0; j-- ){
	MOVF        _i+0, 0 
	MOVWF       R0 
	MOVF        _i+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _state+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_state+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _j+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       _j+1 
L_main3:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _j+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main13
	MOVF        _j+0, 0 
	SUBLW       0
L__main13:
	BTFSC       STATUS+0, 0 
	GOTO        L_main4
;test1.c,21 :: 		SET_BIT(PORTC,RC0);
	BSF         PORTC+0, 0 
;test1.c,22 :: 		Delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	NOP
	NOP
;test1.c,23 :: 		CLEAR_BIT(PORTC,RC0);
	BCF         PORTC+0, 0 
;test1.c,24 :: 		Delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	NOP
	NOP
;test1.c,25 :: 		while((PORTD & 0x01) == 0x01);
L_main8:
	MOVLW       1
	ANDWF       PORTD+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
	GOTO        L_main8
L_main9:
;test1.c,20 :: 		for(j = state[i]; j > 0; j-- ){
	MOVLW       1
	SUBWF       _j+0, 1 
	MOVLW       0
	SUBWFB      _j+1, 1 
;test1.c,26 :: 		}
	GOTO        L_main3
L_main4:
;test1.c,27 :: 		if ( i == 2){
	MOVLW       0
	XORWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main14
	MOVLW       2
	XORWF       _i+0, 0 
L__main14:
	BTFSS       STATUS+0, 2 
	GOTO        L_main10
;test1.c,28 :: 		i = 0;
	CLRF        _i+0 
	CLRF        _i+1 
;test1.c,29 :: 		}
	GOTO        L_main11
L_main10:
;test1.c,31 :: 		i++;
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;test1.c,32 :: 		}
L_main11:
;test1.c,33 :: 		}
L_main2:
;test1.c,34 :: 		}
	GOTO        L_main0
;test1.c,35 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
