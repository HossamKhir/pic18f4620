
_half_toggle:

;MyProject.c,1 :: 		void half_toggle(void)
;MyProject.c,3 :: 		PORTC = 0x55;
	MOVLW       85
	MOVWF       PORTC+0 
;MyProject.c,4 :: 		Delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_half_toggle0:
	DECFSZ      R13, 1, 1
	BRA         L_half_toggle0
	DECFSZ      R12, 1, 1
	BRA         L_half_toggle0
	NOP
	NOP
;MyProject.c,5 :: 		PORTC = 0xAA;
	MOVLW       170
	MOVWF       PORTC+0 
;MyProject.c,6 :: 		Delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_half_toggle1:
	DECFSZ      R13, 1, 1
	BRA         L_half_toggle1
	DECFSZ      R12, 1, 1
	BRA         L_half_toggle1
	NOP
	NOP
;MyProject.c,7 :: 		}
L_end_half_toggle:
	RETURN      0
; end of _half_toggle

_l2r:

;MyProject.c,9 :: 		void l2r(void)
;MyProject.c,11 :: 		int i = 0;
	CLRF        l2r_i_L0+0 
	CLRF        l2r_i_L0+1 
;MyProject.c,12 :: 		for (i = 1; i <= 128; i*=2)
	MOVLW       1
	MOVWF       l2r_i_L0+0 
	MOVLW       0
	MOVWF       l2r_i_L0+1 
L_l2r2:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       l2r_i_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__l2r22
	MOVF        l2r_i_L0+0, 0 
	SUBLW       128
L__l2r22:
	BTFSS       STATUS+0, 0 
	GOTO        L_l2r3
;MyProject.c,14 :: 		PORTC = i;
	MOVF        l2r_i_L0+0, 0 
	MOVWF       PORTC+0 
;MyProject.c,15 :: 		Delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_l2r5:
	DECFSZ      R13, 1, 1
	BRA         L_l2r5
	DECFSZ      R12, 1, 1
	BRA         L_l2r5
	NOP
	NOP
;MyProject.c,12 :: 		for (i = 1; i <= 128; i*=2)
	RLCF        l2r_i_L0+0, 1 
	BCF         l2r_i_L0+0, 0 
	RLCF        l2r_i_L0+1, 1 
;MyProject.c,16 :: 		}
	GOTO        L_l2r2
L_l2r3:
;MyProject.c,17 :: 		}
L_end_l2r:
	RETURN      0
; end of _l2r

_r2l:

;MyProject.c,19 :: 		void r2l(void)
;MyProject.c,21 :: 		int i = 0;
	CLRF        r2l_i_L0+0 
	CLRF        r2l_i_L0+1 
;MyProject.c,22 :: 		for (i = 128; i >= 1; i/=2)
	MOVLW       128
	MOVWF       r2l_i_L0+0 
	MOVLW       0
	MOVWF       r2l_i_L0+1 
L_r2l6:
	MOVLW       128
	XORWF       r2l_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__r2l24
	MOVLW       1
	SUBWF       r2l_i_L0+0, 0 
L__r2l24:
	BTFSS       STATUS+0, 0 
	GOTO        L_r2l7
;MyProject.c,24 :: 		PORTC = i;
	MOVF        r2l_i_L0+0, 0 
	MOVWF       PORTC+0 
;MyProject.c,25 :: 		Delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_r2l9:
	DECFSZ      R13, 1, 1
	BRA         L_r2l9
	DECFSZ      R12, 1, 1
	BRA         L_r2l9
	NOP
	NOP
;MyProject.c,22 :: 		for (i = 128; i >= 1; i/=2)
	RRCF        r2l_i_L0+1, 1 
	RRCF        r2l_i_L0+0, 1 
	BCF         r2l_i_L0+1, 7 
	BTFSC       r2l_i_L0+1, 6 
	BSF         r2l_i_L0+1, 7 
;MyProject.c,26 :: 		}
	GOTO        L_r2l6
L_r2l7:
;MyProject.c,27 :: 		}
L_end_r2l:
	RETURN      0
; end of _r2l

_l2r_double:

;MyProject.c,29 :: 		void l2r_double(void)
;MyProject.c,31 :: 		int i = 0;
	CLRF        l2r_double_i_L0+0 
	CLRF        l2r_double_i_L0+1 
;MyProject.c,32 :: 		for (i = 3; i <= 192; i*=4)
	MOVLW       3
	MOVWF       l2r_double_i_L0+0 
	MOVLW       0
	MOVWF       l2r_double_i_L0+1 
L_l2r_double10:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       l2r_double_i_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__l2r_double26
	MOVF        l2r_double_i_L0+0, 0 
	SUBLW       192
L__l2r_double26:
	BTFSS       STATUS+0, 0 
	GOTO        L_l2r_double11
;MyProject.c,34 :: 		PORTC = i;
	MOVF        l2r_double_i_L0+0, 0 
	MOVWF       PORTC+0 
;MyProject.c,35 :: 		Delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_l2r_double13:
	DECFSZ      R13, 1, 1
	BRA         L_l2r_double13
	DECFSZ      R12, 1, 1
	BRA         L_l2r_double13
	DECFSZ      R11, 1, 1
	BRA         L_l2r_double13
	NOP
;MyProject.c,32 :: 		for (i = 3; i <= 192; i*=4)
	RLCF        l2r_double_i_L0+0, 1 
	BCF         l2r_double_i_L0+0, 0 
	RLCF        l2r_double_i_L0+1, 1 
	RLCF        l2r_double_i_L0+0, 1 
	BCF         l2r_double_i_L0+0, 0 
	RLCF        l2r_double_i_L0+1, 1 
;MyProject.c,36 :: 		}
	GOTO        L_l2r_double10
L_l2r_double11:
;MyProject.c,37 :: 		}
L_end_l2r_double:
	RETURN      0
; end of _l2r_double

_r2l_double:

;MyProject.c,39 :: 		void r2l_double(void)
;MyProject.c,41 :: 		int i = 0;
	CLRF        r2l_double_i_L0+0 
	CLRF        r2l_double_i_L0+1 
;MyProject.c,42 :: 		for (i = 192; i >= 3; i/=4)
	MOVLW       192
	MOVWF       r2l_double_i_L0+0 
	MOVLW       0
	MOVWF       r2l_double_i_L0+1 
L_r2l_double14:
	MOVLW       128
	XORWF       r2l_double_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__r2l_double28
	MOVLW       3
	SUBWF       r2l_double_i_L0+0, 0 
L__r2l_double28:
	BTFSS       STATUS+0, 0 
	GOTO        L_r2l_double15
;MyProject.c,44 :: 		PORTC = i;
	MOVF        r2l_double_i_L0+0, 0 
	MOVWF       PORTC+0 
;MyProject.c,45 :: 		Delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_r2l_double17:
	DECFSZ      R13, 1, 1
	BRA         L_r2l_double17
	DECFSZ      R12, 1, 1
	BRA         L_r2l_double17
	DECFSZ      R11, 1, 1
	BRA         L_r2l_double17
	NOP
;MyProject.c,42 :: 		for (i = 192; i >= 3; i/=4)
	RRCF        r2l_double_i_L0+1, 1 
	RRCF        r2l_double_i_L0+0, 1 
	BCF         r2l_double_i_L0+1, 7 
	BTFSC       r2l_double_i_L0+1, 6 
	BSF         r2l_double_i_L0+1, 7 
	RRCF        r2l_double_i_L0+1, 1 
	RRCF        r2l_double_i_L0+0, 1 
	BCF         r2l_double_i_L0+1, 7 
	BTFSC       r2l_double_i_L0+1, 6 
	BSF         r2l_double_i_L0+1, 7 
;MyProject.c,46 :: 		}
	GOTO        L_r2l_double14
L_r2l_double15:
;MyProject.c,47 :: 		}
L_end_r2l_double:
	RETURN      0
; end of _r2l_double

_main:

;MyProject.c,49 :: 		void main() {
;MyProject.c,50 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;MyProject.c,51 :: 		while(1)
L_main18:
;MyProject.c,54 :: 		l2r_double();
	CALL        _l2r_double+0, 0
;MyProject.c,55 :: 		r2l_double();
	CALL        _r2l_double+0, 0
;MyProject.c,56 :: 		}
	GOTO        L_main18
;MyProject.c,57 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
