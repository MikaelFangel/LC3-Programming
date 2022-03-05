.ORIG x3000
        AND     R0,R0,#0
        ADD     R0,R0,#10
        LD      R6,POP
        LD      R4,PUSH
        JSRR    R4
        AND     R0,R0,#0
        LD      R4,POP
        JSRR    R4
        HALT

POP     .FILL x4000
PUSH    .FILL x4009
PEEK    .FILL x400E
.END