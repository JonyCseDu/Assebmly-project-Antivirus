NAME "FILENAME"

PROC FILENAME
    MOV SI, OFFSET DTA
    ADD SI, 30
    MOV DI, OFFSET FILE

    LOP:
        MOVSB
        CMP [SI], 0
        JE CONDITION
        LOOP LOP

    CONDITION:

        CMP [DI-3], 'l'
        JNE EXIT_FN

        CMP [DI-2], 'n'
        JNE EXIT_FN

        CMP [DI-1], 'k'
        JNE EXIT_FN
        ; FOUND !! DELETE AND PRINT
        MOV [DI], 0DH
        MOV [DI + 1], 0AH
        MOV [DI + 2], '$'

        MOV AH, 9
        MOV DX, OFFSET FILE
        INT 21H
        MOV [DI], 0

        CALL DELETE
        ADD COUNT, 1

    EXIT_FN:
        RET

FILENAME ENDP
INCLUDE "DELETE.ASM"
