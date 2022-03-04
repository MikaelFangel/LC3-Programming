;
; Subroutines for carrying out the out the PUSH and POP functions. This 
; program works with a stack consisting of memory locations x3FFF
; through 3FFB. R6 is the stack pointer.
;
POP             AND     R5,R5,#0        ; R5 <-- success
                ST      R1,Save1        ; Save registers that
                ST      R2,Save2        ; are needed by POP
                LD      R1,EMPTY        ; EMPTY contains -x4000
                ADD     R2,R6,R1        ; Compare stack pointer to -x4000
                BRz     fail_exit       ; Branch if stack is empty
;
                LDR     R0,R6,#0        ; The actual "pop"
                ADD     R6,R6,#1        ; Adjust stack pointer
                BRnzp   success_exit
;
PUSH            AND     R5,R5,#0
                ST      R1,Save1        ; Save registers that
                ST      R2,Save2        ; are needed by PUSH
                LD      R1,FULL         ; FULL contains -x3FFB
                ADD     R2,R6,R1        ; Compare stack pointer to x3FFB
                BRz     fail_exit       ; Branch if stack is full
;
                ADD     R6,R6,#-1       ; Adjust statck pointer
                STR     R0,R6,#0        ; The actual push
success_exit    LD      R2,Save2        ; Restore original
                LD      R1,Save1        ; register values
                RET
;
fail_exit       LD      R2,Save2        ; Restore original
                LD      R1,Save1        ; register values
                ADD     R5,R5,#1        ; R5 <-- failure
;
EMPTY           .FILL   xC000           ; EMPTY contains -x4000
FULL            .FILL   xC005           ; FULL contains -x3FFB
Save1           .FILL   x0000
Save2           .FILL   x0000