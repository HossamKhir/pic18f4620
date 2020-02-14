
_SEGMENT7_vidInit:

;segment7.c,6 :: 		char u8SelectionMask)
;segment7.c,8 :: 		*u32RegisterDataDirection &= ~(0b011111111);
	MOVFF       FARG_SEGMENT7_vidInit_u32RegisterDataDirection+0, FSR0
	MOVFF       FARG_SEGMENT7_vidInit_u32RegisterDataDirection+1, FSR0H
	MOVLW       0
	ANDWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVLW       0
	ANDWF       R1, 1 
	MOVFF       FARG_SEGMENT7_vidInit_u32RegisterDataDirection+0, FSR1
	MOVFF       FARG_SEGMENT7_vidInit_u32RegisterDataDirection+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;segment7.c,9 :: 		*u32RegisterSegmentSelect &= u8SelectionMask;
	MOVFF       FARG_SEGMENT7_vidInit_u32RegisterSegmentSelect+0, FSR0
	MOVFF       FARG_SEGMENT7_vidInit_u32RegisterSegmentSelect+1, FSR0H
	MOVF        FARG_SEGMENT7_vidInit_u8SelectionMask+0, 0 
	ANDWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVLW       0
	ANDWF       R1, 1 
	MOVFF       FARG_SEGMENT7_vidInit_u32RegisterSegmentSelect+0, FSR1
	MOVFF       FARG_SEGMENT7_vidInit_u32RegisterSegmentSelect+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;segment7.c,10 :: 		}
L_end_SEGMENT7_vidInit:
	RETURN      0
; end of _SEGMENT7_vidInit
