
_SEGMENT7_vidInit:

;segment7.c,19 :: 		unsigned char u8SelectionMask)
;segment7.c,21 :: 		ptr_u16DirectionDisplayData    = ptr_u16RegisterSegmentDataDirection;
	MOVF        FARG_SEGMENT7_vidInit_ptr_u16RegisterSegmentDataDirection+0, 0 
	MOVWF       _ptr_u16DirectionDisplayData+0 
	MOVF        FARG_SEGMENT7_vidInit_ptr_u16RegisterSegmentDataDirection+1, 0 
	MOVWF       _ptr_u16DirectionDisplayData+1 
;segment7.c,22 :: 		ptr_u16DirectionDisplaySelect  = ptr_u16RegisterSegmentSelectDirection;
	MOVF        FARG_SEGMENT7_vidInit_ptr_u16RegisterSegmentSelectDirection+0, 0 
	MOVWF       _ptr_u16DirectionDisplaySelect+0 
	MOVF        FARG_SEGMENT7_vidInit_ptr_u16RegisterSegmentSelectDirection+1, 0 
	MOVWF       _ptr_u16DirectionDisplaySelect+1 
;segment7.c,24 :: 		ptr_u16RegisterDisplayData     = ptr_u16RegisterSegmentData;
	MOVF        FARG_SEGMENT7_vidInit_ptr_u16RegisterSegmentData+0, 0 
	MOVWF       _ptr_u16RegisterDisplayData+0 
	MOVF        FARG_SEGMENT7_vidInit_ptr_u16RegisterSegmentData+1, 0 
	MOVWF       _ptr_u16RegisterDisplayData+1 
;segment7.c,25 :: 		ptr_u16RegisterDisplaySelect   = ptr_u16RegisterSegmentSelect;
	MOVF        FARG_SEGMENT7_vidInit_ptr_u16RegisterSegmentSelect+0, 0 
	MOVWF       _ptr_u16RegisterDisplaySelect+0 
	MOVF        FARG_SEGMENT7_vidInit_ptr_u16RegisterSegmentSelect+1, 0 
	MOVWF       _ptr_u16RegisterDisplaySelect+1 
;segment7.c,27 :: 		DISPLAY_DIRECTION_DATA         &= MASK_DISPLAY_DATA_DIRECTION;
	MOVFF       FARG_SEGMENT7_vidInit_ptr_u16RegisterSegmentDataDirection+0, FSR0
	MOVFF       FARG_SEGMENT7_vidInit_ptr_u16RegisterSegmentDataDirection+1, FSR0H
	MOVFF       FARG_SEGMENT7_vidInit_ptr_u16RegisterSegmentDataDirection+0, FSR1
	MOVFF       FARG_SEGMENT7_vidInit_ptr_u16RegisterSegmentDataDirection+1, FSR1H
	MOVLW       0
	ANDWF       POSTINC0+0, 1 
;segment7.c,28 :: 		DISPLAY_DIRECTION_SELECTION    &= u8SelectionMask;
	MOVFF       _ptr_u16DirectionDisplaySelect+0, FSR0
	MOVFF       _ptr_u16DirectionDisplaySelect+1, FSR0H
	MOVFF       _ptr_u16DirectionDisplaySelect+0, FSR1
	MOVFF       _ptr_u16DirectionDisplaySelect+1, FSR1H
	MOVF        FARG_SEGMENT7_vidInit_u8SelectionMask+0, 0 
	ANDWF       POSTINC0+0, 1 
;segment7.c,29 :: 		}
L_end_SEGMENT7_vidInit:
	RETURN      0
; end of _SEGMENT7_vidInit

_SEGMENT7_vidDisplayDigit:

;segment7.c,33 :: 		unsigned char u8Digit)
;segment7.c,35 :: 		DISPLAY_SELECT = u8DisplaySelected;
	MOVFF       _ptr_u16RegisterDisplaySelect+0, FSR1
	MOVFF       _ptr_u16RegisterDisplaySelect+1, FSR1H
	MOVF        FARG_SEGMENT7_vidDisplayDigit_u8DisplaySelected+0, 0 
	MOVWF       POSTINC1+0 
;segment7.c,36 :: 		DISPLAY_DATA   = u8Digit;
	MOVFF       _ptr_u16RegisterDisplayData+0, FSR1
	MOVFF       _ptr_u16RegisterDisplayData+1, FSR1H
	MOVF        FARG_SEGMENT7_vidDisplayDigit_u8Digit+0, 0 
	MOVWF       POSTINC1+0 
;segment7.c,37 :: 		}
L_end_SEGMENT7_vidDisplayDigit:
	RETURN      0
; end of _SEGMENT7_vidDisplayDigit
