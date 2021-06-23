ORG 100h

        section .text
                            ; Se comienza con la limpieza de los registros que se utilizaran
        XOR     AX, AX
        XOR     SI, SI
        XOR     BX, BX
        XOR     CX, CX
        XOR     DX, DX

        MOV     SI, 0
        MOV     DI, 0d

        MOV     DH, 05 ; se indica la fila en la que iniciará el puntero
        MOV     DL, 36 ; se indica la columna en la que iniciará el puntero

        CALL    ModoTexto ; llamada a la función que activa el modo texto
        
        Iterar: 
                ; Se declara la función que permitirá iterar según la cantidad de caracteres deseados

                MOV     byte [ite], 6 ; Veces en la que se va a iterar la cadena

                MOV     DH,05   ; fila en la que se escribirá el primer caractér de la primera cadena
                MOV     DL,36   ; columna en la que se escribirá el primer caractér de la primera cadena

                XOR     DI,DI   
                
                CALL    Despl   ; llamada a la función que irá desplazando al cursor para escribir cada caractér

                MOV     byte [ite], 6
                MOV     DH,08   ; salto a nueva fila para segunda cadena de caracteres, se mantiene la columna
                MOV     DL,35 
                XOR     DI,DI 

                CALL    Despl   ; llamada a la función que irá desplazando al cursor para escribir cada caractér

                MOV     byte [ite], 9 
                MOV     DH,11   ; salto a nueva fila para tercera cadena de caracteres, se mantiene la columna
                MOV     DL,35 
                XOR     DI,DI 

                CALL    Despl   ; llamada a la función que irá desplazando al cursor para escribir cada caractér

                MOV     byte [ite], 9
                MOV     DH,14   ; salto a nueva fila para cuarta cadena de caracteres, se mantiene la columna
                MOV     DL,35 
                XOR     DI,DI 

                CALL    Despl   ; llamada a la función que irá desplazando al cursor para escribir cada caractér

                JMP     EsperarTecla ; llamada a la función que esperara una entrada desde teclado

        Despl:
                CALL    MoverPuntero ; Llamada a función que posicionará el puntero en pantalla

                MOV     CL, [cadena+SI] ; Desplazamiento de los caracteres dentro de la cadena

                CALL    EscribirCar ; Llamada a la función que escribirá cada caractér
                
                INC     SI ; Se incrementa 1 espacio para escribir siguiente caracter
                INC     DL ; Se incrementa 1 espacio para desplazarse a la siguiente columna
                INC     DI ; Se incrementa 1 espacio para llegar a comparar las iteraciones

                CMP     DI, [ite] ; Comparación de DI con el numero de iteraciones
                JB      Despl  
                RET

        ModoTexto: 
                MOV     AH, 0h  ; Activación del modo texto
                MOV     AL, 03h ; Modo gráfico utilizando: 80x25 en dimensiones, 16 colores y 8 páginas
                INT     10h
                RET

        MoverPuntero:
                MOV     AH, 02h ; Posicionamiento del puntero en la pantalla
                MOV     BH, 0h  ; Pagina numero 1
                INT     10h
                RET

        EscribirCar:
                MOV     AH, 0Ah ; Se escribe el caractér según posición del puntero
                MOV     AL, CL  ; se denota el caracter - su valor debe estar en ASCII
                MOV     BH, 0h  ; Número de página
                MOV     CX, 1h  ; Número de veces que se va a escribir el caracter
                INT     10h
                RET

        EsperarTecla:
                MOV     AH, 00h ; Espera al búffer del teclado para poder avanzar a la siguiente instrucción
                INT     16h

        SALIR:
                INT     20h

    section .data

    cadena      DB      'Miguel Angel Mesquita Portillo' ; Variable que guarda nombre completo
    ite DB       0 ; Variable con numero de iteraciones