#ifndef _UWAVE_DISPLAY_H
#define _UWAVE_DISPLAY_H

#include "data_types.h"
#include "macros.h"
#include "segment7.h"

#define UWAVE_REGISTER_DISPLAY_DATA     (REF(TRISD))
#define UWAVE_REGISTER_DISPLAY_SELECT   (REF(TRISA))

#define UWAVE_DISPLAY                   (REF(PORTD))
#define UWAVE_DISPLAY_SELECT            (REF(PORTA))

#define MASK_SECONDS_UNITS          (0x20)
#define MASK_SECONDS_TENS           (0x10)
#define MASK_MINUTES_UNITS          (0x08)
#define MASK_MINUTES_TENS           (0x04)

#define MASK_UWAVE_DISPLAY_SELECT   (~(0x3C))

#define UWAVE_DISPLAY_E             (0x86)
#define UWAVE_DISPLAY_N             (0xAB)
#define UWAVE_DISPLAY_D             (0xA1)

#define UWAVE_DISPLAY_INIT() SEGMENT7_vidInit(UWAVE_REGISTER_DISPLAY_SELECT, \
            UWAVE_REGISTER_DISPLAY_DATA, \
            UWAVE_DISPLAY_SELECT, \
            UWAVE_DISPLAY,\
            MASK_UWAVE_DISPLAY_SELECT);

void UWAVE_DISPLAY_vidUpdateTimeDisplay(uint16);
void UWAVE_DISPLAY_vidDisplayEnd(void);

#endif