.ORIG x3000
LEA R2, vis 
LD R6, USER_SP
ADD R5, R6, #0

AND R1, R1, #0
ADD R6, R6, #-1
STR R1, R6, #0
JSR DFS
TERMINATE TRAP x25
DFS     ADD R6, R6, #-1
        STR R7, R6, #0
        LD R3, SAVE_N
        NOT R3, R3
        ADD R3, R3, xf
        ADD R3, R3, x-10
        ADD R3, R1, R3
        BRz RETURN
        LEA R3, #255
        ADD R3, R3, R1
        ADD R3, R3, R1
        LDR R2, R3, xf
        LEA R4, vis
        ADD R4, R4, R2
        LDR R4, R4, x-10
        BRp CHECK_2
        AND R3, R3, #0
        ADD R3, R3, #1
        STR R3, R4, xf
        ADD R1, R1, #1
        ADD R6, R6, #-1
        STR R1, R6, #0
        JSR #1023
        LDR R1, R6, #1
        LDR R7, R6, #0
        ADD R6, R6, #2
        ADD R0, R0, #0
        BRz #255
        LEA R3, ARRAY
        ADD R3, R3, R1
        ADD R3, R3, R1
        LDR R2, R3, #0
        LEA R4, res
        ADD R4, R4, R1
        STR R2, R4, #0
        AND R0, R0, #0
        ADD R0, R0, #1
        RET
        .BLKW #40       
BK_1    LEA R3, ARRAY
        ADD R3, R3, R1
        ADD R3, R3, R1
        LDR R2, R3, #0
        LEA R4, vis
        ADD R4, R4, R2
        AND R3, R3, #0
        STR R3, R4, #0 
        
CHECK_2 LEA R3, ARRAY
        ADD R3, R3, R1
        ADD R3, R3, R1
        LDR R2, R3, #1
        LEA R4, vis
        ADD R4, R4, R2
        LDR R4, R4, #0 
        BRp CHECK_3
        AND R3, R3, #0
        ADD R3, R3, #1
        STR R3, R4, #0 
        ADD R1, R1, #1
        ADD R6, R6, #-1
        STR R1, R6, #0
        JSR DFS 
        LDR R1, R6, #1
        LDR R7, R6, #0
        ADD R6, R6, #2
        ADD R0, R0, #0
        BRz BK_2
        LEA R3, ARRAY
        ADD R3, R3, R1
        ADD R3, R3, R1
        LDR R2, R3, #1
        LEA R4, res
        ADD R4, R4, R1
        STR R2, R4, #0
        AND R0, R0, #0
        ADD R0, R0, #1
        RET

BK_2    LEA R3, ARRAY
        ADD R3, R3, R1
        ADD R3, R3, R1
        LDR R2, R3, #1
        LEA R4, vis
        ADD R4, R4, R2
        AND R3, R3, #0
        STR R3, R4, #0   
        
CHECK_3 AND R0, R0, #0
        BRnzp RETURN
R0TURN  BR RETURN
RETURN  LDR R7, R6, #0
        LDR R1, R6, #1
ARRAY        ADD R6, R6, #2
        RET
USER_SP .FILL xFE00
SAVE_N      .FILL x0000
ASCII_ZERO  .FILL #-48
ASCII_ZERO_  .FILL #48
vis         .BLKW #20
res         .BLKW #20
.END