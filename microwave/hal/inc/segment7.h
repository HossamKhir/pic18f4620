#ifndef _SEGMENT7_H_
#define _SEGMENT7_H_

#include "data_types.h"
#include "macros.h"

#define MASK_DISPLAY_DATA_DIRECTION     (~(0b011111111))

void SEGMENT7_vidInit(uint16Ref, uint16Ref, uint16Ref, uint16Ref, uint8);
void SEGMENT7_vidDisplayDigit(uint8, uint8);

#endif