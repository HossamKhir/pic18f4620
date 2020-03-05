#include "segment7.h"

uint16Ref u16DirectionDisplayDataRef;
uint16Ref u16DirectionDisplaySelectRef;

uint16Ref u16RegisterDisplayDataRef;
uint16Ref u16RegisterDisplaySelectRef;

const char u8Numbers[10] = {
      0b11000000,        // 0
      0b11111001,        // 1
      0b10100100,        // 2
      0b10110000,        // 3
      0b10011001,        // 4
      0b10010010,        // 5
      0b10000010,        // 6
      0b11111000,        // 7
      0b10000000,        // 8
      0b10010000         // 9
      };

#define DISPLAY_DIRECTION_DATA      (DEREF(u16DirectionDisplayDataRef))
#define DISPLAY_DIRECTION_SELECTION (DEREF(u16DirectionDisplaySelectRef))
#define DISPLAY_DATA                (DEREF(u16RegisterDisplayDataRef))
#define DISPLAY_SELECT              (DEREF(u16RegisterDisplaySelectRef))

#define DISPLAY_ACTIVATE()          (DISPLAY_DIRECTION_DATA &= MASK_DISPLAY_DATA_DIRECTION)
#define DISPLAY_DEACTIVATE()        (DISPLAY_DIRECTION_DATA &= ~MASK_DISPLAY_DATA_DIRECTION)

void
SEGMENT7_vidInit(uint16Ref u16RegisterSegmentSelectDirectionRef,
                 uint16Ref u16RegisterSegmentDataDirectionRef,
                 uint16Ref u16RegisterSegmentSelectRef,
                 uint16Ref u16RegisterSegmentDataRef,
                 uint8 u8SelectionMask)
{
    ADCON1 |= 0X0F;
    
    u16DirectionDisplayDataRef      = u16RegisterSegmentDataDirectionRef;
    u16DirectionDisplaySelectRef    = u16RegisterSegmentSelectDirectionRef;
    
    u16RegisterDisplayDataRef       = u16RegisterSegmentDataRef;
    u16RegisterDisplaySelectRef     = u16RegisterSegmentSelectRef;

    DISPLAY_DIRECTION_SELECTION     &= u8SelectionMask;
    DISPLAY_ACTIVATE();
}

void
SEGMENT7_vidDisplayDigit(uint8 u8DisplaySelected,
                                 uint8 u8Digit)
{
    DISPLAY_ACTIVATE();
    DISPLAY_SELECT = u8DisplaySelected;
    // FIXME: the '~' is to overcome the bug in PicSimLab
    DISPLAY_DATA   = ~u8Numbers[u8Digit];
    DISPLAY_DEACTIVATE();
}

void
SEGMENT7_vidDisplayFigure(uint8 u8DisplaySelected,
                                uint8 u8Figure)
{
    DISPLAY_ACTIVATE();
    DISPLAY_SELECT = u8DisplaySelected;
    // FIXME: the '~' is to overcome the bug in PicSimLab
    DISPLAY_DATA   = ~u8Figure;
    DISPLAY_DEACTIVATE();
}