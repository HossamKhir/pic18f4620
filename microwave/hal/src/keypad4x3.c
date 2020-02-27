#include "keypad4x3.h"

uint16Ref u16DirectionRowsRef;
uint16Ref u16DirectionColumnsRef;

uint16Ref u16DataRowsRef;
uint16Ref u16DataColumnsRef;

uint8 u8MaskRows;
uint8 u8MaskColumns;

#define KEYPAD_DIRECTION_ROWS       (DEREF(u16DirectionRowsRef))
#define KEYPAD_DIRECTION_COLUMNS    (DEREF(u16DirectionColumnsRef))

#define KEYPAD_DATA_ROWS            (DEREF(u16DataRowsRef))
#define KEYPAD_DATA_COLUMNS         (DEREF(u16DataColumnsRef))

#define KEYPAD_ROWS                 (u8MaskRows)
#define KEYPAD_COLUMNS              (u8MaskColumns)

const uint8 u8Keymap[4][3] = {
        { 's',  0,  'h'},   // s for start, h for halt
        { 7,    8,  9},
        { 4,    5,  6},
        { 1,    2,  3},
};

void
KEYPAD4X3_vidInit(uint16Ref u16RowsDirectionRef,
                            uint16Ref u16ColumnsDirectionRef,
                            uint16Ref u16RowsDataRef,
                            uint16Ref u16ColumnsDataRef,
                            uint8 u8RowsMask,
                            uint8 u8ColumnsMask)
{
    ADCON1 |= 0X0F;
    
    u16DirectionRowsRef    = u16RowsDirectionRef;
    u16DirectionColumnsRef = u16ColumnsDirectionRef;
    u16DataRowsRef         = u16RowsDataRef;
    u16DataColumnsRef      = u16ColumnsDataRef;
    
    u8MaskRows    = u8RowsMask;
    u8MaskColumns = u8ColumnsMask;

    SET_BITS(KEYPAD_DIRECTION_ROWS, KEYPAD_ROWS);
    SET_BITS(KEYPAD_DATA_COLUMNS, KEYPAD_COLUMNS);
    SET_BITS(KEYPAD_DATA_ROWS, KEYPAD_ROWS);
    SET_BITS(KEYPAD_DIRECTION_ROWS, KEYPAD_ROWS);
    CLR_BITS(KEYPAD_DIRECTION_COLUMNS, KEYPAD_COLUMNS);
}

uint8
KEYPAD4X3_u8GetKeyPressed(void)
{
    uint8 u8Key = '\0';
    uint8 u8Column = 0;
    uint8 u8RowRead = 0;

    SET_BITS(KEYPAD_DATA_COLUMNS, KEYPAD_COLUMNS);

    for (u8Column = 0; u8Column < 3; u8Column += 1)
    {
        CLR_BIT(KEYPAD_DATA_COLUMNS, u8Column);
        
        u8RowRead = GET_VAL_REG(KEYPAD_DATA_ROWS, KEYPAD_ROWS);

        if (u8RowRead != KEYPAD_ROWS)
        {
            break;
        }
        else
        {
            SET_BIT(KEYPAD_DATA_COLUMNS, u8Column);
        }
    }

    if (u8Column != 3)
    {
        switch(u8RowRead)
        {
            case 0x0E:
                u8Key = u8Keymap[0][u8Column];
            break;
            case 0x0D:
                u8Key = u8Keymap[1][u8Column];
            break;
            case 0x0B:
                u8Key = u8Keymap[2][u8Column];
            break;
            case 0x07:
                u8Key = u8Keymap[3][u8Column];
            break;
            default:
                u8Key = u8Key;
        }
    }
    
    return u8Key;
}
