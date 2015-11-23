NAME "DELETE"

PROC DELETE
    ; SET MAKE = DIR + FILE
    PUSH DI
    MOV DI, OFFSET MAKE
    MOV SI, OFFSET DIR
    L1:
        MOVSB
        CMP [SI], 0
        JNE L1

    MOV SI, OFFSET FILE

    L2:
        MOVSB
        CMP [SI], 0
        JNE L2


    MOV [DI], 0

    ; DELETE MAKE

    MOV AH, 41H
    MOV DX, OFFSET MAKE
    INT 21H
    POP DI
    RET

DELETE ENDP


