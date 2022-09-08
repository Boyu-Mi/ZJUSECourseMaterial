.ORIG x3000
        LD R1, HEAD
        LD R2, REAR
        AND R3, R3, #0
        AND R4, R4, #0
        LEA R4, OUTPUT
        
LOOP    GETC
        ADD R0, R0, #-10
        BRz DONE
        ADD R0, R0, #10
        OUT
        
        LD R3, PLUS
        NOT R3, R3
        ADD R3, R3, #1
        ADD R3, R0, R3
        BRz PUSHL

        LD R3, LT
        NOT R3, R3
        ADD R3, R3, #1
        ADD R3, R0, R3
        BRz PUSHR
        
        LD R3, MINUS
        NOT R3, R3
        ADD R3, R3, #1
        ADD R3, R0, R3
        BRz POPL
        
        LD R3, GT
        NOT R3, R3
        ADD R3, R3, #1
        ADD R3, R0, R3
        BRz POPR
        
PUSHR   GETC
        OUT
        ADD R2, R2, #1
        STR R0, R2, #0
        BRnzp LOOP
        
PUSHL   GETC
        OUT
        ADD R1, R1, #-1
        STR R0, R1, #0
        BRnzp LOOP
        
POPL    NOT R0, R1
        ADD R0, R0, #2
        ADD R0, R0, R2
        BRz EMPTY
        LDR R0, R1, #0
        STR R0, R4, #0
        ADD R1, R1, #1
        ADD R4, R4, #1
        BRnzp LOOP
        
POPR    NOT R0, R1
        ADD R0, R0, #2
        ADD R0, R0, R2
        BRz EMPTY
        LDR R0, R2, #0
        STR R0, R4, #0
        ADD R2, R2, #-1
        ADD R4, R4, #1
        BRnzp LOOP

EMPTY   LD R0, UNDERLINE
        STR R0, R4, #0
        ADD R4, R4, #1
        BRnzp LOOP
        
DONE    AND R0, R0, #0
        STR R0, R4, #0
        LD R0, NEWLINE
        OUT
        
        
        LEA R4, OUTPUT
OUTLOOP LDR R0, R4, #0
        BRz HALT_
        OUT
        ADD R4, R4, #1
        BRnzp OUTLOOP
HALT_   TRAP x25        
        
HEAD    .FILL x4001
REAR    .FILL x4000
PLUS    .FILL x002B
MINUS   .FILL x002D
GT      .FILL x005D
LT      .FILL x005B
UNDERLINE 
        .FILL x005F
NEWLINE .FILL x000A
OUTPUT  .BLKW x0100

.END