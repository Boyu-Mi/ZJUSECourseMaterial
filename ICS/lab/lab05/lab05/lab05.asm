.ORIG x3000
        JSR GETNUM  ; input N
        ST R2, SAVE_N ; store N
        ADD R4, R2, #0
        LEA R3, ARRAY
        ADD R3, R3, #2
LOOP    JSR GETNUM
        STR R2, R3, #0
        ADD R3, R3, #1
        JSR GETNUM
        STR R2, R3, #0
        ADD R3, R3, #1
        ADD R4, R4, #-1
        BRp LOOP
        BRnzp DONE

DONE     

;initialize sp and control link
LD R6, USER_SP
ADD R5, R6, #0
;R1 is the argument passed to subroutine DFS

AND R1, R1, #0
;caller passes the arguments to callee(caller saved)
ADD R6, R6, #-1
STR R1, R6, #0
JSR DFS ; dfs(0)
LEA R1, res
ADD R1, R1, #1
LD R2, SAVE_N
LD R3, ASCII_ZERO_

out_loop
LDR R0, R1, #0
ADD R0, R0, R3
OUT
AND R0, R0, #0
ADD R0, R0, #10
OUT
ADD R1, R1, #1
ADD R2, R2, #-1
BRp out_loop

TERMINATE Trap x25

DFS     ADD R6, R6, #-1
        STR R7, R6, #0
        AND R0, R0, #0
        ADD R0, R0, #1
        LD R3, save_N
        NOT R3, R3
        ADD R3, R3, #1
        
        ADD R3, R1, R3
        BRz RETURN ; R1 == N
        ;calculations on tmps
        LEA R3, ARRAY
        ADD R3, R3, #2
        ADD R3, R3, R1
        ADD R3, R3, R1
        LDR R2, R3, #0
        LEA R4, vis
        ADD R4, R4, R2
        LDR R4, R4, #0 ; vis[R2] = 0
        BRp CHECK_2
        LEA R4, vis
        ADD R4, R4, R2
        AND R3, R3, #0
        ADD R3, R3, #1
        STR R3, R4, #0 ; vis[R2] <- 1
        ADD R1, R1, #1 ; i + 1
        ADD R6, R6, #-1
        STR R1, R6, #0
B       JSR DFS ; now R0 is tmp
        ; LDR R1, R6, #1
        ; LDR R7, R6, #0
        ; ADD R6, R6, #2
        ADD R0, R0, #0
        BRz BK_1
        ;update res
        LEA R3, ARRAY
        ADD R3, R3, R1
        ADD R3, R3, R1
        LDR R2, R3, #0
        
        LEA R4, res
        ADD R4, R4, R1
        STR R2, R4, #0 ; res[r1] = r2 
        AND R0, R0, #0
        ADD R0, R0, #1
        BRnzp RETURN
        
BK_1    ADD R1, R1, #-1;
        LEA R3, ARRAY
        ADD R3, R3, #2
        ADD R3, R3, R1
        ADD R3, R3, R1
        LDR R2, R3, #0
        LEA R4, vis
        ADD R4, R4, R2
        AND R3, R3, #0
        STR R3, R4, #0
         ;vis[R2] <- 0
        
CHECK_2 LEA R3, ARRAY
        ADD R3, R3, #2
        ADD R3, R3, R1
        ADD R3, R3, R1
        LDR R2, R3, #1
        LEA R4, vis
        ADD R4, R4, R2
        LDR R4, R4, #0 ; vis[R2] = 0
        BRp CHECK_3
        LEA R4, vis
        ADD R4, R4, R2
        AND R3, R3, #0
        ADD R3, R3, #1
        STR R3, R4, #0 ; vis[R2] <- 1
        ADD R1, R1, #1
        ADD R6, R6, #-1
        STR R1, R6, #0
        
C       JSR DFS ; now R0 is tmp
        ; LDR R1, R6, #1
        ; LDR R7, R6, #0
        ; ADD R6, R6, #2
        ADD R0, R0, #0
        BRz BK_2
        LEA R3, ARRAY
        ADD R3, R3, #2
        ADD R3, R3, R1
        ADD R3, R3, R1
        LDR R2, R3, #-1
        LEA R4, res
        ADD R4, R4, R1
        STR R2, R4, #0
        AND R0, R0, #0
        ADD R0, R0, #1
        BRnzp RETURN

BK_2    ADD R1, R1, #-1
        LEA R3, ARRAY
        ADD R3, R3, #2  
        ADD R3, R3, R1
        ADD R3, R3, R1
        LDR R2, R3, #1
        LEA R4, vis
        ADD R4, R4, R2
        AND R3, R3, #0
        STR R3, R4, #0 ; vis[R2] <- 0   
        
        
CHECK_3 AND R0, R0, #0

RETURN  LDR R7, R6, #0
        LDR R1, R6, #1
        ADD R6, R6, #2
        RET

GETNUM  GETC
        OUT
        LD R1, ASCII_ZERO
        ADD R2, R0, R1
        GETC 
        OUT
        ADD R0, R0, R1
        BRn END
        ADD R1, R2, R2 ; R1 = 2R2
        ADD R2, R1, R1
        ADD R2, R2, R2 ; 8R2
        ADD R2, R2, R1 ; 10R2
        ADD R2, R2, R0 ;
        GETC
        OUT
END     RET
USER_SP .FILL XFE00
SAVE_N      .FILL x0000
ASCII_ZERO  .FILL #-48
ASCII_ZERO_  .FILL #48
ARRAY        .BLKW #40 ; array to store numbers
vis         .BLKW #20
res         .BLKW #20
.END