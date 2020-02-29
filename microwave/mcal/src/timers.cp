#line 1 "E:/embedded_diploma/projects/pic/microwave/mcal/src/timers.c"
#line 1 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/timers.h"
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/data_types.h"



typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned int uint32;
typedef unsigned long uint64;

typedef enum {
 TIMER0,
 TIMER1,
 TIMER2,
 TIMER3
} enTimer;

typedef enum {
 PRE001,
 PRE002,
 PRE004,
 PRE008,
 PRE016,
 PRE032,
 PRE064,
 PRE128,
 PRE256
} enPrescale;

typedef enum {
 POS01,
 POS02,
 POS03,
 POS04,
 POS05,
 POS06,
 POS07,
 POS08,
 POS09,
 POS10,
 POS11,
 POS12,
 POS13,
 POS14,
 POS15,
 POS16
} enPostscale;

typedef enum {
 CHDH = 0x0C,
 CHDL,
 CLDH,
 CLDL
} enPWMMode;

typedef struct {
 uint8 u8Seconds;
 uint8 u8Minutes;
 uint16 u16TimeDisplay;
}HeatingTime;

typedef uint8* uint8Ref;
typedef uint16* uint16Ref;
typedef uint32* uint32Ref;
typedef uint64* uint64Ref;

typedef HeatingTime* HeatingTimeRef;
#line 1 "e:/embedded_diploma/projects/pic/microwave/util/inc/macros.h"
#line 52 "e:/embedded_diploma/projects/pic/microwave/mcal/inc/timers.h"
void TIMERS_vidInitTimer(enTimer, enPrescale, enPostscale, uint64, uint64);
void TIMERS_vidUpdateInitialCount(uint64 , enTimer, enPrescale, enPostscale);
void TIMERS_vidResetTimer(uint8);
#line 3 "E:/embedded_diploma/projects/pic/microwave/mcal/src/timers.c"
static uint64 u64InitialCount = 0;


const uint16 u16Prescaler[4][9][2] = {

 {{0,0}, {0,2}, {1,4}, {2,8}, {3,16}, {4,32}, {5,64}, {6,128}, {7,256}},
 {{0,1}, {1,2}, {2,4}, {3,8}, {0,0}, {0,0}, {0,0}, {0,0}, {0,0}},
 {{0,1}, {0,0}, {1,4}, {0,0}, {2,16}, {0,0}, {0,0}, {0,0}, {0,0}},
 {{0,1}, {1,2}, {2,4}, {3,8}, {0,0}, {0,0}, {0,0}, {0,0}, {0,0}}
};

static void
TIMERS_vidSetScale(enTimer timerID,
 enPrescale prescale,
 enPostscale postscale)
{
 switch (timerID)
 {
 case TIMER0:
  ( T0CON )  |= (u16Prescaler[timerID][prescale][0] << (4 * (timerID % 2)));
 break;
 case TIMER1:
  ( T1CON )  |= (u16Prescaler[timerID][prescale][0] << (4 * (timerID % 2)));
 break;
 case TIMER2:
  ( T2CON )  |= (u16Prescaler[timerID][prescale][0] << (4 * (timerID % 2)));
  ( T2CON )  |= (postscale << 3);
 break;
 case TIMER3:
  ( T3CON )  |= (u16Prescaler[timerID][prescale][0] << (4 * (timerID % 2)));
 break;
 }
}

void
TIMERS_vidInitTimer(enTimer timerID,
 enPrescale prescale,
 enPostscale postscale,
 uint64 u64TargetTime,
 uint64 u64TimeUnit
)
{
 u64TargetTime =  ((u64TargetTime)*(u64TimeUnit)) ;
 TIMERS_vidUpdateInitialCount(u64TargetTime, timerID, prescale, postscale);
 TIMERS_vidSetScale(timerID, prescale, postscale);
 TIMERS_vidResetTimer(timerID);
}

void
TIMERS_vidUpdateInitialCount(uint64 u64TargetTime,
 enTimer timerID,
 enPrescale prescale,
 enPostscale postscale
)
{
 switch (timerID)
 {
 case TIMER0:
 case TIMER1:
 case TIMER3:
 u64InitialCount = ( (0xFFFF)  + 1) - (uint64)(u64TargetTime / ( ((1.0/( 8000000UL /4.0))* 1000000UL )  * (double)u16Prescaler[timerID][prescale][1]));
 break;
 case TIMER2:
 u64InitialCount = (uint64)(u64TargetTime / ( ((1.0/( 8000000UL /4.0))* 1000000UL )  * (double)u16Prescaler[timerID][prescale][1] * (postscale + 1)));
 break;
 }
}

void
TIMERS_vidResetTimer(enTimer timerID)
{
 switch (timerID)
 {
 case TIMER0:
  { TMR0L = (((u64InitialCount))&0xFF) ; TMR0H = ( ((((u64InitialCount))>>8)&0xFF) ) ; } ;
  (INTCON. TMR0IF =0) ;
 break;
 case TIMER1:
  { TMR1L = (((u64InitialCount))&0xFF) ; TMR1H = ( ((((u64InitialCount))>>8)&0xFF) ) ; } ;
  (INTCON. TMR1IF =0) ;
 break;
 case TIMER3:
  { TMR3L = (((u64InitialCount))&0xFF) ; TMR3H = ( ((((u64InitialCount))>>8)&0xFF) ) ; } ;
  (INTCON. TMR3IF =0) ;
 break;
 case TIMER2:

 PR2 =  ((u64InitialCount)&0xFF) ;
  (INTCON. TMR2IF =0) ;
 break;
 }
}
