
_main:

;main.c,7 :: 		void main() {
;main.c,9 :: 		UWAVE_INIT();
	MOVLW       127
	ANDWF       TRISB+0, 1 
	MOVLW       127
	ANDWF       PORTB+0, 1 
	BCF         TRISC+0, 5 
	BCF         PORTC+0, 5 
	CALL        _UWAVE_SENSORS_vidInit+0, 0
	MOVLW       TRISD+0
	MOVWF       FARG_KEYPAD4X3_vidInit+0 
	MOVLW       hi_addr(TRISD+0)
	MOVWF       FARG_KEYPAD4X3_vidInit+1 
	MOVLW       TRISB+0
	MOVWF       FARG_KEYPAD4X3_vidInit+0 
	MOVLW       hi_addr(TRISB+0)
	MOVWF       FARG_KEYPAD4X3_vidInit+1 
	MOVLW       PORTD+0
	MOVWF       FARG_KEYPAD4X3_vidInit+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_KEYPAD4X3_vidInit+1 
	MOVLW       PORTB+0
	MOVWF       FARG_KEYPAD4X3_vidInit+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_KEYPAD4X3_vidInit+1 
	MOVLW       15
	MOVWF       FARG_KEYPAD4X3_vidInit+0 
	MOVLW       7
	MOVWF       FARG_KEYPAD4X3_vidInit+0 
	CALL        _KEYPAD4X3_vidInit+0, 0
	MOVLW       TRISA+0
	MOVWF       FARG_SEGMENT7_vidInit+0 
	MOVLW       hi_addr(TRISA+0)
	MOVWF       FARG_SEGMENT7_vidInit+1 
	MOVLW       TRISD+0
	MOVWF       FARG_SEGMENT7_vidInit+0 
	MOVLW       hi_addr(TRISD+0)
	MOVWF       FARG_SEGMENT7_vidInit+1 
	MOVLW       PORTA+0
	MOVWF       FARG_SEGMENT7_vidInit+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_SEGMENT7_vidInit+1 
	MOVLW       PORTD+0
	MOVWF       FARG_SEGMENT7_vidInit+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_SEGMENT7_vidInit+1 
	MOVLW       195
	MOVWF       FARG_SEGMENT7_vidInit+0 
	CALL        _SEGMENT7_vidInit+0, 0
;main.c,11 :: 		time.u8Seconds = 9;
	MOVLW       9
	MOVWF       _time+0 
;main.c,13 :: 		TIMERS_vidInitTimer(TIMER0, P128, 1, SECOND);
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
;main.c,14 :: 		START_TMR(TIMER0);
	BSF         T0CON+0, 7 
;main.c,15 :: 		while(1)
L_main0:
;main.c,17 :: 		SEGMENT7_vidDisplayDigit(0x20, time.u8Seconds); // 0x00100000
	MOVLW       32
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	MOVF        _time+0, 0 
	MOVWF       FARG_SEGMENT7_vidDisplayDigit+0 
	CALL        _SEGMENT7_vidDisplayDigit+0, 0
;main.c,18 :: 		if(INTCON.TMR0IF)
	BTFSS       INTCON+0, 2 
	GOTO        L_main2
;main.c,20 :: 		UWAVE_UTIL_u8DecrementTime(REF(time));
	MOVLW       _time+0
	MOVWF       FARG_UWAVE_UTIL_u8DecrementTime+0 
	MOVLW       hi_addr(_time+0)
	MOVWF       FARG_UWAVE_UTIL_u8DecrementTime+1 
	CALL        _UWAVE_UTIL_u8DecrementTime+0, 0
;main.c,21 :: 		TIMERS_vidResetTimer(TIMER0);
	CLRF        FARG_TIMERS_vidResetTimer+0 
	CALL        _TIMERS_vidResetTimer+0, 0
;main.c,22 :: 		START_TMR(TIMER0);
	BSF         T0CON+0, 7 
;main.c,23 :: 		}
L_main2:
;main.c,29 :: 		}
	GOTO        L_main0
;main.c,30 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
