;Author: tranDuyAnh
;created: 9.12.2024

.model small
.stack 100h
.data    
    ten dw 10
    msg db 'Type something here: $'
    alert db 'Answer: $'
    nline db 13, 10, '$'
    num db ?
.code 
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 1 
    int 21h
    
    sub al, '0' 
    mov cx, 0
    mov cl, al
    
    mov bx, 1
    mov ax, 1
    
for1:
    mul bx
    inc bx
    cmp bx, cx
    jle for1
    
    mov cx, 0
for2:
    mov dx, 0
    div ten
    push dx
    inc cx
    cmp ax, 0
    jne for2
    
    lea dx, nline
    mov ah, 9
    int 21h  
    lea dx, alert
    int 21h
    
for3:
    pop dx
    add dx, '0'
    mov ah, 2
    int 21h
    loop for3
        
    mov ah, 4ch
    int 21h
main endp
