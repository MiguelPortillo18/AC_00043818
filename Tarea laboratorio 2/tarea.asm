        org     100h

        section .text

        mov     BX, 200h
        
        mov     AL, "M"
        mov     CH, "A"
        mov     DL, "M"
        mov     DH, "P"

        mov     [0200h], AL
        mov     [0201h], CH
        mov     [0202h], DL
        mov     [0203h], DH

;       Direccionamiento directo o absoluto
        mov     AX, [200h]
        mov     SI, [200h]

;       Direccionamiento indirecto por registro
        mov     CH, [BX]

;       Direccionamiento indirecto base mas indice
        mov     [BX + DI], DL

;       Direccionamiento relativo por registro
        mov     DH, [DI + 100h]


        int     20h