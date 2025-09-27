IOsetup:
    LD A, 0x0F
    OUT (02), A
    LD A, 0x0F
    OUT (03), A
    RET

display:
; Display the contents of memory locations F0 to F7 on the LED matrix
; port 00 selects the row, port 01 sets the column data
    LD A, 0x01
    OUT (00), A
    LD A, (0x00F0)
    OUT (01), A
    LD A, 0x02
    OUT (00), A
    LD A, (0x00F1)
    OUT (01), A
    LD A, 0x04
    OUT (00), A
    LD A, (0x00F2)
    OUT (01), A
    LD A, 0x08
    OUT (00), A
    LD A, (0x00F3)
    OUT (01), A
    LD A, 0x10
    OUT (00), A
    LD A, (0x00F4)
    OUT (01), A
    LD A, 0x20
    OUT (00), A
    LD A, (0x00F5)
    OUT (01), A
    LD A, 0x40
    OUT (00), A
    LD A, (0x00F6)
    OUT (01), A
    LD A, 0x80
    OUT (00), A
    LD A, (0x00F7)
    OUT (01), A
    RET
START:
    CALL IOsetup
    LD A, 0x00

LOOP:
LD (0x00F0), A
INC A
LD (0x00F1), A
INC A
LD (0x00F2), A
INC A
LD (0x00F3), A
INC A
LD (0x00F4), A
INC A
LD (0x00F5), A
INC A
LD (0x00F6), A
INC A
LD (0x00F7), A
CALL display
JP LOOP
; End of program

