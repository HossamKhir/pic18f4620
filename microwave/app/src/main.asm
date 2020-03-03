
_main:

;main.c,8 :: 		void main() {
;main.c,9 :: 		UWAVE_INIT();
	MOVLW       127
	ANDWF       TRISB+0, 1 
	MOVLW       127
	ANDWF       PORTB+0, 1 
	BCF         TRISC+0, 5 
	BCF         PORTC+0, 5 
	CALL        _UWAVE_SENSORS_vidInit+0, 0
	MOVLW       12
	MOVWF       FARG_PWM_vidInit+0 
	MOVLW       25
	MOVWF       FARG_PWM_vidInit+0 
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
;main.c,14 :: 		while(1)
L_main0:
;main.c,16 :: 		};
	GOTO        L_main0
;main.c,18 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
