org     100h

        section .text
                XOR DI, DI ; Limpiando registro DI
                XOR SI, SI ; limpiando registro SI
                MOV word CX, 5d ; tendra 5 iteraciones
                MOV AX, 1d
                jmp iterar ; salto sin condicion, se mueve a la porcion del codigo cuya etiqueta sea iterar
        
        iterar: 
                MOV BX, CX
                MUL BX
                LOOP iterar

                MOV [20Bh], BX
        exit:
            int 20h