#ifndef _KEYPAD_4X3_H_
#define _KEYPAD_4X3_H_

#include "data_types.h"
#include "macros.h"
#include "segment7.h"

void KEYPAD4X3_vidInit(uint16Ref, uint16Ref, uint16Ref, uint16Ref, uint8,
     uint8);
uint8 KEYPAD4X3_u8GetKeyPressed(void);

#endif