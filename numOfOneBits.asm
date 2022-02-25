.ORIG x3000
        AND R1, R1, #0
        AND R2, R2, #0
        ADD R2, R2, #15
TEST    ADD R0, R0, #0
        BRp DECR
        ADD R1, R1, #1
DECR    ADD R0, R0, R0          ; Bitwise leftshift
        ADD R2, R2, #-1
        BRz TEST
        TRAP x25
.END