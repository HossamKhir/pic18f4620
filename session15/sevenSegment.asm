
_main:

;sevenSegment.c,3 :: 		void main() {
;sevenSegment.c,4 :: 		TRISC &= ~(15 << 0);
	MOVLW       240
	ANDWF       TRISC+0, 1 
;sevenSegment.c,5 :: 		PORTC &= ~(15 << 0);
	MOVLW       240
	ANDWF       PORTC+0, 1 
;sevenSegment.c,6 :: 		TRISD &= ~(63 << 0);
	MOVLW       192
	ANDWF       TRISD+0, 1 
;sevenSegment.c,7 :: 		PORTD &= ~(63 << 0);
	MOVLW       192
	ANDWF       PORTD+0, 1 
;sevenSegment.c,8 :: 		while (1)
L_main0:
;sevenSegment.c,10 :: 		for (i = 0; i <= 50; i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_main2:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _i+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main15
	MOVF        _i+0, 0 
	SUBLW       50
L__main15:
	BTFSS       STATUS+0, 0 
	GOTO        L_main3
;sevenSegment.c,12 :: 		PORTD = 1;
	MOVLW       1
	MOVWF       PORTD+0 
;sevenSegment.c,13 :: 		PORTC = second % 10;
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
	MOVF        R0, 0 
	MOVWF       PORTC+0 
;sevenSegment.c,14 :: 		Delay_us(3333);
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
;sevenSegment.c,15 :: 		PORTD = 2;
	MOVLW       2
	MOVWF       PORTD+0 
;sevenSegment.c,16 :: 		PORTC = second /10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _second+0, 0 
	MOVWF       R0 
	MOVF        _second+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       PORTC+0 
;sevenSegment.c,17 :: 		Delay_us(3333);
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
;sevenSegment.c,18 :: 		PORTD = 4;
	MOVLW       4
	MOVWF       PORTD+0 
;sevenSegment.c,19 :: 		PORTC = minute % 10;
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
	MOVF        R0, 0 
	MOVWF       PORTC+0 
;sevenSegment.c,20 :: 		Delay_us(3333);
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
;sevenSegment.c,21 :: 		PORTD = 8;
	MOVLW       8
	MOVWF       PORTD+0 
;sevenSegment.c,22 :: 		PORTC = minute /10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _minute+0, 0 
	MOVWF       R0 
	MOVF        _minute+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       PORTC+0 
;sevenSegment.c,23 :: 		Delay_us(3333);
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
;sevenSegment.c,24 :: 		PORTD = 16;
	MOVLW       16
	MOVWF       PORTD+0 
;sevenSegment.c,25 :: 		PORTC = hour % 10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _hour+0, 0 
	MOVWF       R0 
	MOVF        _hour+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       PORTC+0 
;sevenSegment.c,26 :: 		Delay_us(3333);
	MOVLW       5
	MOVWF       R12, 0
	MOVLW       82
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	NOP
	NOP
;sevenSegment.c,27 :: 		PORTD = 32;
	MOVLW       32
	MOVWF       PORTD+0 
;sevenSegment.c,28 :: 		PORTC = hour /10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _hour+0, 0 
	MOVWF       R0 
	MOVF        _hour+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       PORTC+0 
;sevenSegment.c,29 :: 		Delay_us(3333);
	MOVLW       5
	MOVWF       R12, 0
	MOVLW       82
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	NOP
	NOP
;sevenSegment.c,10 :: 		for (i = 0; i <= 50; i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;sevenSegment.c,30 :: 		}
	GOTO        L_main2
L_main3:
;sevenSegment.c,32 :: 		second++;
	INFSNZ      _second+0, 1 
	INCF        _second+1, 1 
;sevenSegment.c,33 :: 		if (second == 60)
	MOVLW       0
	XORWF       _second+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main16
	MOVLW       60
	XORWF       _second+0, 0 
L__main16:
	BTFSS       STATUS+0, 2 
	GOTO        L_main11
;sevenSegment.c,35 :: 		second = 0;
	CLRF        _second+0 
	CLRF        _second+1 
;sevenSegment.c,36 :: 		minute++;
	INFSNZ      _minute+0, 1 
	INCF        _minute+1, 1 
;sevenSegment.c,37 :: 		}
L_main11:
;sevenSegment.c,38 :: 		if (minute == 60)
	MOVLW       0
	XORWF       _minute+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main17
	MOVLW       60
	XORWF       _minute+0, 0 
L__main17:
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
;sevenSegment.c,40 :: 		minute = 0;
	CLRF        _minute+0 
	CLRF        _minute+1 
;sevenSegment.c,41 :: 		hour++;
	INFSNZ      _hour+0, 1 
	INCF        _hour+1, 1 
;sevenSegment.c,42 :: 		}
L_main12:
;sevenSegment.c,43 :: 		if (hour == 24)
	MOVLW       0
	XORWF       _hour+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main18
	MOVLW       24
	XORWF       _hour+0, 0 
L__main18:
	BTFSS       STATUS+0, 2 
	GOTO        L_main13
;sevenSegment.c,45 :: 		hour = 0;
	CLRF        _hour+0 
	CLRF        _hour+1 
;sevenSegment.c,46 :: 		}
L_main13:
;sevenSegment.c,47 :: 		}
	GOTO        L_main0
;sevenSegment.c,49 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
