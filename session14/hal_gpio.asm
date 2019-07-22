
_port_io_init:

;hal_gpio.c,3 :: 		void port_io_init(uint16_t *ptr, uint8_t pin, uint8_t state){
;hal_gpio.c,4 :: 		if(state == 0){        //output
	MOVF        FARG_port_io_init_state+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_port_io_init0
;hal_gpio.c,5 :: 		CLEAR_BIT(*ptr, pin);
	MOVF        FARG_port_io_init_pin+0, 0 
	MOVWF       R2 
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
L__port_io_init5:
	BZ          L__port_io_init6
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__port_io_init5
L__port_io_init6:
	COMF        R0, 1 
	COMF        R1, 1 
	MOVFF       FARG_port_io_init_ptr+0, FSR0
	MOVFF       FARG_port_io_init_ptr+1, FSR0H
	MOVFF       FARG_port_io_init_ptr+0, FSR1
	MOVFF       FARG_port_io_init_ptr+1, FSR1H
	MOVF        R0, 0 
	ANDWF       POSTINC1+0, 1 
	MOVF        R1, 0 
	ANDWF       POSTINC1+0, 1 
;hal_gpio.c,6 :: 		}
	GOTO        L_port_io_init1
L_port_io_init0:
;hal_gpio.c,8 :: 		SET_BIT(*ptr, pin);
	MOVF        FARG_port_io_init_pin+0, 0 
	MOVWF       R2 
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
L__port_io_init7:
	BZ          L__port_io_init8
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__port_io_init7
L__port_io_init8:
	MOVFF       FARG_port_io_init_ptr+0, FSR0
	MOVFF       FARG_port_io_init_ptr+1, FSR0H
	MOVFF       FARG_port_io_init_ptr+0, FSR1
	MOVFF       FARG_port_io_init_ptr+1, FSR1H
	MOVF        R0, 0 
	IORWF       POSTINC1+0, 1 
	MOVF        R1, 0 
	IORWF       POSTINC1+0, 1 
;hal_gpio.c,9 :: 		}
L_port_io_init1:
;hal_gpio.c,10 :: 		}
L_end_port_io_init:
	RETURN      0
; end of _port_io_init

_port_on_iff_init:

;hal_gpio.c,11 :: 		void port_on_iff_init(uint16_t *ptr, uint8_t pin, uint8_t state){
;hal_gpio.c,12 :: 		if(state == 0){        //off
	MOVF        FARG_port_on_iff_init_state+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_port_on_iff_init2
;hal_gpio.c,13 :: 		CLEAR_BIT(*ptr, pin);
	MOVF        FARG_port_on_iff_init_pin+0, 0 
	MOVWF       R2 
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
L__port_on_iff_init10:
	BZ          L__port_on_iff_init11
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__port_on_iff_init10
L__port_on_iff_init11:
	COMF        R0, 1 
	COMF        R1, 1 
	MOVFF       FARG_port_on_iff_init_ptr+0, FSR0
	MOVFF       FARG_port_on_iff_init_ptr+1, FSR0H
	MOVFF       FARG_port_on_iff_init_ptr+0, FSR1
	MOVFF       FARG_port_on_iff_init_ptr+1, FSR1H
	MOVF        R0, 0 
	ANDWF       POSTINC1+0, 1 
	MOVF        R1, 0 
	ANDWF       POSTINC1+0, 1 
;hal_gpio.c,14 :: 		}
	GOTO        L_port_on_iff_init3
L_port_on_iff_init2:
;hal_gpio.c,16 :: 		SET_BIT(*ptr, pin);
	MOVF        FARG_port_on_iff_init_pin+0, 0 
	MOVWF       R2 
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
L__port_on_iff_init12:
	BZ          L__port_on_iff_init13
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__port_on_iff_init12
L__port_on_iff_init13:
	MOVFF       FARG_port_on_iff_init_ptr+0, FSR0
	MOVFF       FARG_port_on_iff_init_ptr+1, FSR0H
	MOVFF       FARG_port_on_iff_init_ptr+0, FSR1
	MOVFF       FARG_port_on_iff_init_ptr+1, FSR1H
	MOVF        R0, 0 
	IORWF       POSTINC1+0, 1 
	MOVF        R1, 0 
	IORWF       POSTINC1+0, 1 
;hal_gpio.c,17 :: 		}
L_port_on_iff_init3:
;hal_gpio.c,18 :: 		}
L_end_port_on_iff_init:
	RETURN      0
; end of _port_on_iff_init
