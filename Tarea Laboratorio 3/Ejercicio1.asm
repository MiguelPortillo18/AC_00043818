        org     100h

        section .text
                XOR DI, DI ; Limpiando registro DI
                XOR SI, SI ; limpiando registro SI
                MOV word CX, 8d ; Tamano de la variable
                XOR AX, AX
                jmp iterar ; salto sin condicion, se mueve a la porcion del codigo cuya etiqueta sea iterar
        
        iterar: 
                MOV byte AL, [carnet+DI]
                MOV byte [200h+SI], AL
                MOV AH, [200h+SI]
                XOR AH, 48d
                ADD BL, AH
                INC DI
                INC SI
                LOOP iterar
                XOR AX, AX
                MOV AL, BL
                MOV BX, 08h
                DIV BL
                MOV [20Ah], BL
        exit:
                int 20h

        section .data

        carnet DB "00043818"