leer:
    mov si,00h
    mov ax,0000
    mov ah, 01h
    int 21h
    mov [vtext+si],al
    inc si
    cmp al,0dh
        jne leer1

    mov ah,000h
    mov al, 11100011b
    mov dx,00
    int 14h

    mov si,000h
    jmp enviar


enviar:
    mov ah,01h  ;petision para caracter de transmision
    mov al.[vtext+si]


    cmp al ,0dh
        je menu

    mov dx,00   ;puerto com1
    int 14h
    jmp enviar






josechigua03@gmail.com