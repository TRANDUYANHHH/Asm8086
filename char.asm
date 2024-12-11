;Author: tranDuyAnh
;created 11/12/2024

.model small
.stack 100h 
.data
    char db ?        
    msg db 'Type your input: $'
    nline db 10, 13, '$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, msg
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    mov char, al
    
    lea dx, nline
    mov ah, 9
    int 21h
    
    mov dl, char
    mov ah, 2
    int 21h 
    
    mov ah, 4ch
    int 21h
main endp
