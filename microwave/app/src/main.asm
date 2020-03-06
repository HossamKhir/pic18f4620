
_main:

;main.c,4 :: 		main(void)
;main.c,6 :: 		UWAVE_INIT();
	MOVLW       127
	ANDWF       TRISB+0, 1 
	MOVLW       127
	ANDWF       PORTB+0, 1 
	BCF         TRISC+0, 5 
	BCF         PORTC+0, 5 
	MOVLW       12
	MOVWF       FARG_PWM_vidInit+0 
	MOVLW       25
	MOVWF       FARG_PWM_vidInit+0 
	MOVLW       0
	MOVWF       FARG_PWM_vidInit+1 
	MOVLW       10
	MOVWF       FARG_PWM_vidInit+0 
	MOVLW       0
	MOVWF       FARG_PWM_vidInit+1 
	MOVWF       FARG_PWM_vidInit+2 
	MOVWF       FARG_PWM_vidInit+3 
	MOVLW       232
	MOVWF       FARG_PWM_vidInit+0 
	MOVLW       3
	MOVWF       FARG_PWM_vidInit+1 
	MOVLW       0
	MOVWF       FARG_PWM_vidInit+2 
	MOVLW       0
	MOVWF       FARG_PWM_vidInit+3 
	CALL        _PWM_vidInit+0, 0
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
	CALL        _UWAVE_SENSORS_vidInit+0, 0
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
	CLRF        FARG_TIMERS_vidInitTimer+0 
	MOVLW       5
	MOVWF       FARG_TIMERS_vidInitTimer+0 
	CLRF        FARG_TIMERS_vidInitTimer+0 
	MOVLW       250
	MOVWF       FARG_TIMERS_vidInitTimer+0 
	MOVLW       0
	MOVWF       FARG_TIMERS_vidInitTimer+1 
	MOVWF       FARG_TIMERS_vidInitTimer+2 
	MOVWF       FARG_TIMERS_vidInitTimer+3 
	MOVLW       232
	MOVWF       FARG_TIMERS_vidInitTimer+0 
	MOVLW       3
	MOVWF       FARG_TIMERS_vidInitTimer+1 
	MOVLW       0
	MOVWF       FARG_TIMERS_vidInitTimer+2 
	MOVLW       0
	MOVWF       FARG_TIMERS_vidInitTimer+3 
	CALL        _TIMERS_vidInitTimer+0, 0
	CLRF        FARG_TIMERS_vidConfigTimerInterrupts+0 
	MOVLW       1
	MOVWF       FARG_TIMERS_vidConfigTimerInterrupts+0 
	CALL        _TIMERS_vidConfigTimerInterrupts+0, 0
;main.c,8 :: 		UWAVE_UTIL_vidScheduler();
	CALL        _UWAVE_UTIL_vidScheduler+0, 0
;main.c,9 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
