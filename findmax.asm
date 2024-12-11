.model small
.stack 100h
.data
    msg db 'Your array: $'
    nline db 10, 13, '$'
    msg2 db 'Max value: $'
    arr db 6, 2, 4, 3, 5, 9, 7
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg
    int 21h
    
    mov cx, 0
    mov cl, [arr]
    lea si, [arr]
    mov bx, 0
    
for1:
    lodsb 
    mov dx, [si]
    add dx, '0'
    mov ah, 2
    int 21h
    mov dx, ' '
    int 21h
    cmp bl, [si]
    jge bypass
    mov bl, [si]
bypass:
    loop for1
    
    lea dx, nline
    mov ah, 9
    int 21h
    
    lea dx, msg2
    int 21h
    
    mov dx, bx 
    add dx, '0'
    mov ah, 2
    int 21h
    mov ah, 4ch
    int 21h
main endp
