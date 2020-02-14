#include "segment7.h"
      
void
SEGMENT7_vidInit(int* u32RegisterDataDirection,
                     int* u32RegisterSegmentSelect,
                     char u8SelectionMask)
{
    *u32RegisterDataDirection &= ~(0b011111111);
    *u32RegisterSegmentSelect &= u8SelectionMask;
}