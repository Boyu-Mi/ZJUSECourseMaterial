.ORIG x3000
        
AND R1, R1, #0
AND R2, R2, #0

LEA R0, BININT ; the head of BININT
ADD R1, R1, #1 ; 1
STR R1, R0, #3 ; 3
ADD R1, R1, R1 ; 2
STR R1, R0, #2
ADD R1, R1, R1 ; 4
STR R1, R0, #1
ADD R1, R1, R1 ; 8
STR R1, R0, #0
AND R1, R1, #0
AND R0, R0, #0

LEA R0, OUTPUT
LD R1, ASCII0
STR R1, R0, #0
STR R1, R0, #1
STR R1, R0, #2
STR R1, R0, #3
AND R1, R1, #0

LOOP    
    GETC
    OUT
    ADD R0, R0, #-10
    BRz disp
    ADD R0, R0, #10
    ADD R2, R1, R1
    ADD R1, R2, R2
    ADD R1, R1, R1 ; 8*original R1
    ADD R1, R1, R2 ; 10*original R1
    ADD R0, R0, #-16
    ADD R0, R0, #-16
    ADD R0, R0, #-16
    ADD R1, R1, R0
    BRnzp LOOP   
    
; ADD R1, R1, R3

disp

    LEA R0, HEXCHAR
    AND R2, R1, #15
    ADD R3, R2, R0
    LDR R4, R3, #0
    LEA R0, OUTPUT
    STR R4, R0, #3
    AND R2, R2, #0
    AND R3, R3, #0
    ADD R3, R3, #8
    ADD R3, R3, #8
    AND R0, R0, #0
    
    
    ADD R0, R0, #2 ; counter j
    ST R1, SAVER1
LOOPj 
    AND R2, R2, #0
    ADD R2, R2, #3 ; counter i
    AND R4, R4, #0
    LD R1, SAVER1 ; recover R1
    LOOPi
        ST R1, SAVER1
        AND R1, R1, R3
        BRz ENDi        ; R1 & R3 = 0, continue
        LEA R1, BININT
        ADD R1, R1, R2 ; R1 = binint + i
        LDR R1, R1, #0  ; R1 = binint[i]
        ADD R4, R4, R1  ; R4 += binint[i]
    ENDi
        ADD R3, R3, R3 ; R3 <<= 1
        LD R1, SAVER1 ; recover R1
        ADD R2, R2, #-1
        BRzp LOOPi
        
    LEA R1, HEXCHAR ; R1 = HEXCHAR
    ADD R1, R1, R4 ; R1 = HEXCHAR + R4
    LDR R4, R1, #0 ; R4 = HEXCHAR[R4]
    
    LEA R1, OUTPUT 
    ADD R1, R1, R0 ; R1 = OUTPUT + j
    STR R4, R1, #0 ; OUTPUT[j] = R4
    
ENDj
    ADD R0, R0, #-1
    BRzp LOOPj

;disp 

AND R0, R0, #0
LEA R1, OUTPUT
LDR R0, R1, #0
OUT
ADD R1, R1, #1
LDR R0, R1, #0 
OUT
ADD R1, R1, #1
LDR R0, R1, #0
OUT
ADD R1, R1, #1
LDR R0, R1, #0
OUT
HALT

HEXCHAR .STRINGZ "0123456789ABCDEF"
BININT .BLKW 4 ; {8, 4, 2, 1}
OUTPUT .BLKW 4
SAVER0 .FILL x1000
SAVER1 .FILL x0000
SAVER2 .FILL x0000
SAVER3 .FILL x0000
ASCII0 .FILL x0030
        .END