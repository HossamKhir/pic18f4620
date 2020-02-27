
_SEGMENT7_vidInit:

;segment7.c,34 :: 		uint8 u8SelectionMask)
;segment7.c,36 :: 		ADCON1 |= 0X0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;segment7.c,38 :: 		u16DirectionDisplayDataRef      = u16RegisterSegmentDataDirectionRef;
	MOVF        FARG_SEGMENT7_vidInit_u16RegisterSegmentDataDirectionRef+0, 0 
	MOVWF       _u16DirectionDisplayDataRef+0 
	MOVF        FARG_SEGMENT7_vidInit_u16RegisterSegmentDataDirectionRef+1, 0 
	MOVWF       _u16DirectionDisplayDataRef+1 
;segment7.c,39 :: 		u16DirectionDisplaySelectRef    = u16RegisterSegmentSelectDirectionRef;
	MOVF        FARG_SEGMENT7_vidInit_u16RegisterSegmentSelectDirectionRef+0, 0 
	MOVWF       _u16DirectionDisplaySelectRef+0 
	MOVF        FARG_SEGMENT7_vidInit_u16RegisterSegmentSelectDirectionRef+1, 0 
	MOVWF       _u16DirectionDisplaySelectRef+1 
;segment7.c,41 :: 		u16RegisterDisplayDataRef       = u16RegisterSegmentDataRef;
	MOVF        FARG_SEGMENT7_vidInit_u16RegisterSegmentDataRef+0, 0 
	MOVWF       _u16RegisterDisplayDataRef+0 
	MOVF        FARG_SEGMENT7_vidInit_u16RegisterSegmentDataRef+1, 0 
	MOVWF       _u16RegisterDisplayDataRef+1 
;segment7.c,42 :: 		u16RegisterDisplaySelectRef     = u16RegisterSegmentSelectRef;
	MOVF        FARG_SEGMENT7_vidInit_u16RegisterSegmentSelectRef+0, 0 
	MOVWF       _u16RegisterDisplaySelectRef+0 
	MOVF        FARG_SEGMENT7_vidInit_u16RegisterSegmentSelectRef+1, 0 
	MOVWF       _u16RegisterDisplaySelectRef+1 
;segment7.c,44 :: 		DISPLAY_DIRECTION_SELECTION     &= u8SelectionMask;
	MOVFF       FARG_SEGMENT7_vidInit_u16RegisterSegmentSelectDirectionRef+0, FSR0
	MOVFF       FARG_SEGMENT7_vidInit_u16RegisterSegmentSelectDirectionRef+1, FSR0H
	MOVFF       FARG_SEGMENT7_vidInit_u16RegisterSegmentSelectDirectionRef+0, FSR1
	MOVFF       FARG_SEGMENT7_vidInit_u16RegisterSegmentSelectDirectionRef+1, FSR1H
	MOVF        FARG_SEGMENT7_vidInit_u8SelectionMask+0, 0 
	ANDWF       POSTINC0+0, 1 
;segment7.c,45 :: 		DISPLAY_ACTIVATE();
	MOVFF       _u16DirectionDisplayDataRef+0, FSR0
	MOVFF       _u16DirectionDisplayDataRef+1, FSR0H
	MOVFF       _u16DirectionDisplayDataRef+0, FSR1
	MOVFF       _u16DirectionDisplayDataRef+1, FSR1H
	MOVLW       0
	ANDWF       POSTINC0+0, 1 
;segment7.c,46 :: 		}
L_end_SEGMENT7_vidInit:
	RETURN      0
; end of _SEGMENT7_vidInit

_SEGMENT7_vidDisplayDigit:

;segment7.c,50 :: 		uint8 u8Digit)
;segment7.c,52 :: 		DISPLAY_SELECT = u8DisplaySelected;
	MOVFF       _u16RegisterDisplaySelectRef+0, FSR1
	MOVFF       _u16RegisterDisplaySelectRef+1, FSR1H
	MOVF        FARG_SEGMENT7_vidDisplayDigit_u8DisplaySelected+0, 0 
	MOVWF       POSTINC1+0 
;segment7.c,54 :: 		DISPLAY_DATA   = ~u8Numbers[u8Digit];
	MOVLW       _u8Numbers+0
	ADDWF       FARG_SEGMENT7_vidDisplayDigit_u8Digit+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_u8Numbers+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_u8Numbers+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVFF       _u16RegisterDisplayDataRef+0, FSR1
	MOVFF       _u16RegisterDisplayDataRef+1, FSR1H
	COMF        R0, 0 
	MOVWF       POSTINC1+0 
;segment7.c,55 :: 		}
L_end_SEGMENT7_vidDisplayDigit:
	RETURN      0
; end of _SEGMENT7_vidDisplayDigit
