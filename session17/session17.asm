
_main:

;session17.c,1 :: 		void main() {
;session17.c,2 :: 		TRISC &= ~(3 << 0);
	MOVLW       252
	ANDWF       TRISC+0, 1 
;session17.c,3 :: 		PORTC &= ~(3 << 0);
	MOVLW       252
	ANDWF       PORTC+0, 1 
;session17.c,4 :: 		TRISD |= (3 << 0);
	MOVLW       3
	IORWF       TRISD+0, 1 
;session17.c,5 :: 		while(1)
L_main0:
;session17.c,7 :: 		if(PORTD == 1)
	MOVF        PORTD+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
;session17.c,9 :: 		PORTC = 1;
	MOVLW       1
	MOVWF       PORTC+0 
;session17.c,10 :: 		}
	GOTO        L_main3
L_main2:
;session17.c,11 :: 		else if(PORTD == 2)
	MOVF        PORTD+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
;session17.c,13 :: 		PORTC = 2;
	MOVLW       2
	MOVWF       PORTC+0 
;session17.c,14 :: 		}
	GOTO        L_main5
L_main4:
;session17.c,17 :: 		PORTC = 0;
	CLRF        PORTC+0 
;session17.c,18 :: 		}
L_main5:
L_main3:
;session17.c,19 :: 		}
	GOTO        L_main0
;session17.c,22 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
