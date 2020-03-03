
_INTERRUPT_vidInit:

;interrupt.c,4 :: 		INTERRUPT_vidInit(void)
;interrupt.c,6 :: 		INTERRUPT_ENABLE_GLOBAL();
	BSF         INTCON+0, 7 
;interrupt.c,7 :: 		INTERRUPT_ENABLE_PERIPHERAL();
	BSF         INTCON+0, 6 
;interrupt.c,8 :: 		INTERRUPT_ENABLE_PRIORITY();
	BSF         RCON+0, 7 
;interrupt.c,9 :: 		}
L_end_INTERRUPT_vidInit:
	RETURN      0
; end of _INTERRUPT_vidInit

_INTERRUPT_vidSetPriority:

;interrupt.c,12 :: 		INTERRUPT_vidSetPriority(enInterruptPriority interruptSource,enPriority priority)
;interrupt.c,14 :: 		switch(interruptSource)
	GOTO        L_INTERRUPT_vidSetPriority0
;interrupt.c,16 :: 		case IntPr_RB:
L_INTERRUPT_vidSetPriority2:
;interrupt.c,17 :: 		INTCON2.RBIP = priority;
	BTFSC       FARG_INTERRUPT_vidSetPriority_priority+0, 0 
	GOTO        L__INTERRUPT_vidSetPriority8
	BCF         INTCON2+0, 0 
	GOTO        L__INTERRUPT_vidSetPriority9
L__INTERRUPT_vidSetPriority8:
	BSF         INTCON2+0, 0 
L__INTERRUPT_vidSetPriority9:
;interrupt.c,18 :: 		break;
	GOTO        L_INTERRUPT_vidSetPriority1
;interrupt.c,19 :: 		case IntPr_TMR0:
L_INTERRUPT_vidSetPriority3:
;interrupt.c,20 :: 		INTCON2.TMR0IP = priority;
	BTFSC       FARG_INTERRUPT_vidSetPriority_priority+0, 0 
	GOTO        L__INTERRUPT_vidSetPriority10
	BCF         INTCON2+0, 2 
	GOTO        L__INTERRUPT_vidSetPriority11
L__INTERRUPT_vidSetPriority10:
	BSF         INTCON2+0, 2 
L__INTERRUPT_vidSetPriority11:
;interrupt.c,21 :: 		break;
	GOTO        L_INTERRUPT_vidSetPriority1
;interrupt.c,22 :: 		case IntPr_INT1:
L_INTERRUPT_vidSetPriority4:
;interrupt.c,23 :: 		INTCON3.INT1IP = priority;
	BTFSC       FARG_INTERRUPT_vidSetPriority_priority+0, 0 
	GOTO        L__INTERRUPT_vidSetPriority12
	BCF         INTCON3+0, 6 
	GOTO        L__INTERRUPT_vidSetPriority13
L__INTERRUPT_vidSetPriority12:
	BSF         INTCON3+0, 6 
L__INTERRUPT_vidSetPriority13:
;interrupt.c,24 :: 		break;
	GOTO        L_INTERRUPT_vidSetPriority1
;interrupt.c,25 :: 		case IntPr_INT2:
L_INTERRUPT_vidSetPriority5:
;interrupt.c,26 :: 		INTCON3.INT2IP = priority;
	BTFSC       FARG_INTERRUPT_vidSetPriority_priority+0, 0 
	GOTO        L__INTERRUPT_vidSetPriority14
	BCF         INTCON3+0, 7 
	GOTO        L__INTERRUPT_vidSetPriority15
L__INTERRUPT_vidSetPriority14:
	BSF         INTCON3+0, 7 
L__INTERRUPT_vidSetPriority15:
;interrupt.c,27 :: 		break;
	GOTO        L_INTERRUPT_vidSetPriority1
;interrupt.c,28 :: 		}
L_INTERRUPT_vidSetPriority0:
	MOVF        FARG_INTERRUPT_vidSetPriority_interruptSource+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_INTERRUPT_vidSetPriority2
	MOVF        FARG_INTERRUPT_vidSetPriority_interruptSource+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_INTERRUPT_vidSetPriority3
	MOVF        FARG_INTERRUPT_vidSetPriority_interruptSource+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_INTERRUPT_vidSetPriority4
	MOVF        FARG_INTERRUPT_vidSetPriority_interruptSource+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_INTERRUPT_vidSetPriority5
L_INTERRUPT_vidSetPriority1:
;interrupt.c,29 :: 		}
L_end_INTERRUPT_vidSetPriority:
	RETURN      0
; end of _INTERRUPT_vidSetPriority
