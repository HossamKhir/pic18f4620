
_main:

;sevenSegment.c,17 :: 		void main() {
;sevenSegment.c,26 :: 		SEGMENT7_vidInit(&TRISD, &TRISA, ~(0x3C));
	MOVLW       TRISD+0
	MOVWF       FARG_SEGMENT7_vidInit+0 
	MOVLW       hi_addr(TRISD+0)
	MOVWF       FARG_SEGMENT7_vidInit+1 
	MOVLW       TRISA+0
	MOVWF       FARG_SEGMENT7_vidInit+0 
	MOVLW       hi_addr(TRISA+0)
	MOVWF       FARG_SEGMENT7_vidInit+1 
	MOVLW       195
	MOVWF       FARG_SEGMENT7_vidInit+0 
	CALL        _SEGMENT7_vidInit+0, 0
;sevenSegment.c,28 :: 		while (1)
L_main0:
;sevenSegment.c,30 :: 		for (i = 0; i <= 50; i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_main2:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _i+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main13
	MOVF        _i+0, 0 
	SUBLW       50
L__main13:
	BTFSS       STATUS+0, 0 
	GOTO        L_main3
;sevenSegment.c,32 :: 		PORTA = 32;
	MOVLW       32
	MOVWF       PORTA+0 
;sevenSegment.c,33 :: 		PORTD = numbers[second % 10];
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _second+0, 0 
	MOVWF       R0 
	MOVF        _second+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       _numbers+0
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_numbers+0)
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_numbers+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R1, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTD+0
;sevenSegment.c,34 :: 		Delay_us(3333);
	MOVLW       5
	MOVWF       R12, 0
	MOVLW       82
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	NOP
	NOP
;sevenSegment.c,35 :: 		PORTA = 16;
	MOVLW       16
	MOVWF       PORTA+0 
;sevenSegment.c,36 :: 		PORTD = numbers[second /10];
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _second+0, 0 
	MOVWF       R0 
	MOVF        _second+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       _numbers+0
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_numbers+0)
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_numbers+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R1, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTD+0
;sevenSegment.c,37 :: 		Delay_us(3333);
	MOVLW       5
	MOVWF       R12, 0
	MOVLW       82
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	NOP
	NOP
;sevenSegment.c,38 :: 		PORTA = 8;
	MOVLW       8
	MOVWF       PORTA+0 
;sevenSegment.c,39 :: 		PORTD = numbers[minute % 10];
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _minute+0, 0 
	MOVWF       R0 
	MOVF        _minute+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       _numbers+0
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_numbers+0)
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_numbers+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R1, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTD+0
;sevenSegment.c,40 :: 		Delay_us(3333);
	MOVLW       5
	MOVWF       R12, 0
	MOVLW       82
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	NOP
	NOP
;sevenSegment.c,41 :: 		PORTA = 4;
	MOVLW       4
	MOVWF       PORTA+0 
;sevenSegment.c,42 :: 		PORTD = numbers[minute /10];
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _minute+0, 0 
	MOVWF       R0 
	MOVF        _minute+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       _numbers+0
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_numbers+0)
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_numbers+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R1, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTD+0
;sevenSegment.c,43 :: 		Delay_us(3333);
	MOVLW       5
	MOVWF       R12, 0
	MOVLW       82
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	NOP
	NOP
;sevenSegment.c,30 :: 		for (i = 0; i <= 50; i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;sevenSegment.c,50 :: 		}
	GOTO        L_main2
L_main3:
;sevenSegment.c,52 :: 		second++;
	INFSNZ      _second+0, 1 
	INCF        _second+1, 1 
;sevenSegment.c,53 :: 		if (second == 60)
	MOVLW       0
	XORWF       _second+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main14
	MOVLW       60
	XORWF       _second+0, 0 
L__main14:
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
;sevenSegment.c,55 :: 		second = 0;
	CLRF        _second+0 
	CLRF        _second+1 
;sevenSegment.c,56 :: 		minute++;
	INFSNZ      _minute+0, 1 
	INCF        _minute+1, 1 
;sevenSegment.c,57 :: 		}
L_main9:
;sevenSegment.c,58 :: 		if (minute == 60)
	MOVLW       0
	XORWF       _minute+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main15
	MOVLW       60
	XORWF       _minute+0, 0 
L__main15:
	BTFSS       STATUS+0, 2 
	GOTO        L_main10
;sevenSegment.c,60 :: 		minute = 0;
	CLRF        _minute+0 
	CLRF        _minute+1 
;sevenSegment.c,61 :: 		hour++;
	INFSNZ      _hour+0, 1 
	INCF        _hour+1, 1 
;sevenSegment.c,62 :: 		}
L_main10:
;sevenSegment.c,63 :: 		if (hour == 24)
	MOVLW       0
	XORWF       _hour+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main16
	MOVLW       24
	XORWF       _hour+0, 0 
L__main16:
	BTFSS       STATUS+0, 2 
	GOTO        L_main11
;sevenSegment.c,65 :: 		hour = 0;
	CLRF        _hour+0 
	CLRF        _hour+1 
;sevenSegment.c,66 :: 		}
L_main11:
;sevenSegment.c,67 :: 		}
	GOTO        L_main0
;sevenSegment.c,69 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
