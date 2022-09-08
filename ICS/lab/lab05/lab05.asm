            .ORIG   x3000
            LD      R0, DATA
            AND     R2, R2, #0
            ADD     R3, R0, R0
            ADD     R4, R3, R3
            AND     R1, R3, R4
            AND     R1, R1, R0
            BRz     NO
            ADD     R2, R2, #1
NO          HALT
DATA        .FILL   x1234
            .END
