#ifndef _DATA_TYPES_H_
#define _DATA_TYPES_H_

typedef unsigned char           uint8;
typedef unsigned short          uint16;
typedef unsigned int            uint32;
typedef unsigned long           uint64;


typedef uint8*        uint8Ref;
typedef uint16*       uint16Ref;
typedef uint32*       uint32Ref;
typedef uint64*       uint64Ref;

typedef struct {
    uint8 u8Seconds;
    uint8 u8Minutes;
    uint16 u16TimeDisplay;
}HeatingTime;

typedef HeatingTime*  HeatingTimeRef;




#endif