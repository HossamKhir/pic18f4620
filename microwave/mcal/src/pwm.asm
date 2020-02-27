
_PWM_vidInit:

;pwm.c,4 :: 		PWM_vidInit(uint8 u8Mode, uint16 u16DutyCycle)
;pwm.c,6 :: 		PWM_SET_MODE(u8Mode);
	MOVLW       240
	ANDWF       CCP1CON+0, 0 
	MOVWF       R1 
	MOVLW       15
	ANDWF       FARG_PWM_vidInit_u8Mode+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	IORWF       R1, 0 
	MOVWF       CCP1CON+0 
;pwm.c,8 :: 		PWM_SET_DUTY_CYCLE(u16DutyCycle);
	MOVF        FARG_PWM_vidInit_u16DutyCycle+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       48
	ANDWF       R0, 1 
	MOVF        R0, 0 
	IORWF       CCP1CON+0, 1 
	MOVLW       255
	ANDWF       FARG_PWM_vidInit_u16DutyCycle+0, 0 
	MOVWF       CCPR1L+0 
;pwm.c,15 :: 		PWM_ACTIVATE();
	BCF         TRISC+0, 2 
;pwm.c,16 :: 		}
L_end_PWM_vidInit:
	RETURN      0
; end of _PWM_vidInit
