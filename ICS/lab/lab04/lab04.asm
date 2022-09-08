.ORIG x0200
    
    LD R0, KBINT_ADD
    STI R0, KBINT_entry ; The PC is loaded with the contents of memory location x0180
    LD R0, KBSR_D
    STI R0, KBSR_addr ; enable the interrupt
    
    ; PUSH USER_PSR and USER_PC
    LD R6, OS_SP
    ADD R6, R6, #-2
    LD R0, USER_PSR
    STR R0, R6, #1
    LD R0, USER_PC
    STR R0, R6, #0
    RTI

    OS_SP .FILL x3000
    USER_PSR .FILL x8002
    USER_PC .FILL x3000
    KBSR_addr .FILL xFE00
    KBSR_D .FILL x4000
    KBINT_entry .FILL x0180
    KBINT_ADD .FILL x2000
.END


.ORIG   x2000
        ST R0, saveR0	
		LD R1, saveR1
	    ST R2, saveR2
	    ST R3, saveR3
		LDI R0, KBDR     
; 		LDR R0, R3, #0	
        LD  R2, ASCII_NINE
        NOT R2, R2
        ADD R2, R2, #1
        ADD R2, R0, R2
        BRp ISCHAR ; R0 > '9'
        LD  R2, ASCII_ZERO
        NOT R2, R2
        ADD R2, R2, #1
        ADD R2, R0, R2
        BRzp MOVE ; '0' <= R0 <= '9'
        BRnzp END ; R0 < '0'
        
ISCHAR  LD  R2, ASCII_a
        NOT R2, R2
        ADD R2, R2, #1
        ADD R2, R0, R2
        BRn END ; R0 < 'a'
        LD  R2, ASCII_z
        NOT R2, R2
        ADD R2, R2, #1
        ADD R2, R0, R2
        BRnz TRANS; 'a' <= R0 <= 'z'
        BRnzp END

        
MOVE    LD R2, ASCII_ZERO
        NOT R2, R2
        ADD R2, R2, #1
        ADD R2, R2, R0 ; offset
        ADD R2, R2, R4
        LD  R0, N_SEVENTEEN
        ADD R0, R2, R0
        BRnz SKIP ; if new offset > 17, change it to 17
        AND R2, R2, #0
        ADD R2, R2, #9
        ADD R2, R2, #8
        
SKIP    ADD R2, R2, #0
        LD  R3, ASCII_DOT
        ADD R0, R1, R4 ; previous ofs
        ADD R4, R2, #0 ; update R4
        LDR R5, R0, #0 ; previous char
        STR R3, R0, #0
        STR R3, R0, #1
        STR R3, R0, #2
        ADD R3, R5, #0 ; R3 = R0
        ADD R0, R1, R2
        STR R3, R0, #0
        STR R3, R0, #1
        STR R3, R0, #2
        BRnzp END
        
TRANS   
        ; LEA R1, OUTPUT
        ; ADD R2, R1, R2
        ADD R2, R1, R4
        STR R0, R2, #0
        STR R0, R2, #1
        STR R0, R2, #2
        BRnzp END
        
END     
        ADD R0, R1, #0
        PUTS 
        AND R0, R0, #0
        ADD R0, R0, #10
        OUT
        LD R0, saveR0
        ; LD R1, saveOUT
	    LD R2, saveR2
	    LD R3, saveR3 
        RTI				

KBDR	    .FILL xFE02
DSR		    .FILL xFE04
DDR		    .FILL xFE06
ASCII_ZERO  .FILL x0030
ASCII_NINE  .FILL x0039
ASCII_a     .FILL x0061
ASCII_z     .FILL x007A
ASCII_DOT   .FILL x002E
N_SEVENTEEN .FILL xFFEF
saveR0	    .FILL x0000
saveR1      .FILL x3022 ; to be done
saveR2	    .FILL x0000
saveR3      .FILL x0000
saveOUT     .FILL x0000
OUTPUT_adr  .BLKW #1
            .END


.ORIG x3000
        LEA R1, OUTPUT
        OUTPUT      .STRINGZ "aabbccdd"
        OOO .STRINGZ "aabbc"
        LEA R1, #55
label   LD R3, FOURTY

        
LABEL_       .FILL x0000
LABEL__       .FILL x0000
FOURTY      .FILL x8000
DELAY_COUNT .FILL #256
SAVER0_     .FILL x0000
SAVER2_     .FILL x0000
SAVER3_     .FILL x0000
DOT         .FILL x002E
OUT_ADDR    .FILL x3022 

            .END