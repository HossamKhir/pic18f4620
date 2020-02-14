#include "segment7.h"

unsigned short *ptr_u16DirectionDisplayData;
unsigned short *ptr_u16DirectionDisplaySelect;

unsigned short *ptr_u16RegisterDisplayData;
unsigned short *ptr_u16RegisterDisplaySelect;

#define DISPLAY_DIRECTION_DATA               (*ptr_u16DirectionDisplayData)
#define DISPLAY_DIRECTION_SELECTION          (*ptr_u16DirectionDisplaySelect)
#define DISPLAY_DATA                         (*ptr_u16RegisterDisplayData)
#define DISPLAY_SELECT                       (*ptr_u16RegisterDisplaySelect)
      
void
SEGMENT7_vidInit(unsigned short* ptr_u16RegisterSegmentDataDirection,
                     unsigned short* ptr_u16RegisterSegmentSelectDirection,
                     unsigned short* ptr_u16RegisterSegmentData,
                     unsigned short* ptr_u16RegisterSegmentSelect,
                     unsigned char u8SelectionMask)
{
    ptr_u16DirectionDisplayData    = ptr_u16RegisterSegmentDataDirection;
    ptr_u16DirectionDisplaySelect  = ptr_u16RegisterSegmentSelectDirection;
    
    ptr_u16RegisterDisplayData     = ptr_u16RegisterSegmentData;
    ptr_u16RegisterDisplaySelect   = ptr_u16RegisterSegmentSelect;
    
    DISPLAY_DIRECTION_DATA         &= MASK_DISPLAY_DATA_DIRECTION;
    DISPLAY_DIRECTION_SELECTION    &= u8SelectionMask;
}

void
SEGMENT7_vidDisplayDigit(unsigned char u8DisplaySelected,
                                  unsigned char u8Digit)
{
    DISPLAY_SELECT = u8DisplaySelected;
    DISPLAY_DATA   = u8Digit;
}