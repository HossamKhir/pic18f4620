#ifndef _DATA_TYPES_H_
#define _DATA_TYPES_H_

typedef unsigned char   uint8;
typedef unsigned short  uint16;
typedef unsigned int    uint32;
typedef unsigned long   uint64;

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

typedef uint8*          uint8Ref;
typedef uint16*         uint16Ref;
typedef uint32*         uint32Ref;
typedef uint64*         uint64Ref;

typedef HeatingTime*  HeatingTimeRef;




#endif