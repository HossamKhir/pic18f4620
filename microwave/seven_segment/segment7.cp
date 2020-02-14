#line 1 "E:/embedded_diploma/projects/pic/microwave/seven_segment/segment7.c"
#line 1 "e:/embedded_diploma/projects/pic/microwave/seven_segment/segment7.h"



 void SEGMENT7_vidInit(int*, int*, char);
#line 3 "E:/embedded_diploma/projects/pic/microwave/seven_segment/segment7.c"
void
SEGMENT7_vidInit(int* u32RegisterDataDirection,
 int* u32RegisterSegmentSelect,
 char u8SelectionMask)
{
 *u32RegisterDataDirection &= ~(0b011111111);
 *u32RegisterSegmentSelect &= u8SelectionMask;
}
