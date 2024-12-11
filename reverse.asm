;Author: tranDuyAnh
;created 11/12/2024

.model small
.stack 100h 
.data                   
    msg db 'Type your input: $'
    nline db 10, 13, '$'
    str db 100 dup('$')
.code                   
main proc
    mov ax, @data
    mov ds, ax
     
    lea dx, msg
    mov ah, 9
    int 21h
    
    mov ah, 10
    lea dx, str
    int 21h
    
    
    mov ah, 9
    lea dx, nline
    int 21h
    
    mov cx, 0
    mov cl, [str + 1]
    lea si, str + 2
for1:
    push [si]
    inc si
    loop for1
    
    mov cx, 0
    mov cl, [str + 1]
for2:
    pop dx
    mov ah, 2
    int 21h
    loop for2
    
    mov ah, 4ch
    int 21h
main endp
