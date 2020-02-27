#ifndef _UWAVE_KEYPAD_H_
#define _UWAVE_KEYPAD_H_

#include "keypad4x3.h"

#define UWAVE_KEYPAD_DIRECTION_ROW (REF(TRISD))
#define UWAVE_KEYPAD_ROW           (REF(PORTD))
#define MASK_ROW                       (0x0F)

#define UWAVE_KEYPAD_DIRECTION_COLUMN (REF(TRISB))
#define UWAVE_KEYPAD_COLUMN           (REF(PORTB))
#define MASK_COLUMN                       (0x07)

#define UWAVE_KEYPAD_INIT() { \
                                KEYPAD4X3_vidInit(UWAVE_KEYPAD_DIRECTION_ROW, \
                                UWAVE_KEYPAD_DIRECTION_COLUMN, \
                                UWAVE_KEYPAD_ROW, \
                                UWAVE_KEYPAD_COLUMN, \
                                MASK_ROW, \
                                MASK_COLUMN); \
                            }

#endif /* _UWAVE_KEYPAD_H_ */
