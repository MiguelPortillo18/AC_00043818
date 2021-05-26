    org     100h

    section .text

    mov     BP, arrNumImp      ; BP = puntero a arrNumImp
    mov     BX, 300h           ; BX = direccion donde se guardara info
    call    SaveArr            ; llamda de la funcion

    mov     BP, arrNumPar      ; BP = puntero a arrNumPar 
    mov     BX, 320h           ; BX = direccion donde se guarda la info
    call    SaveArr            ; llamada de la funcion

    int     20h

    section .data

arrNumImp db   01,07,11,15,03,0xA   ; arreglo de numeros byte impares
arrNumPar db   02,14,16,08,30,0xA   ; arreglo de numeros byte pares

;   Funcion para guardar un arreglo en distintas
;   direcciones de memoria

SaveArr:
        xor     SI, SI         ; SI = 0
while:
        mov     AL, [BP+SI]    ; Se guarda en AL el valor del puntero + SI
        cmp     AL, 0xA        ; Verifica condicion de paro
        je      end            ; salta a end si se cumple la condicion de paro
        mov     [BX+SI], AL    ; Se guarda en AL, la direccion de guardado + SI
        inc     SI             ; Incremento de SI en 1
        jmp     while          ; Salto incondicional al while
end:
        ret                    ; return al main