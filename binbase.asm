.model small
.stack 100h
.data
    msg db 'Your number: $'
    msg2 db 'Chang to bin base: $'
    nline db 10, 13, '$'
    n db 9
    sc dw 2
.code 
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg
    int 21h
        
    mov dx, 0
    mov dl, n
    add dl, '0'
    mov ah, 2
    int 21h
     
    mov ah, 9
    lea dx, nline
    int 21h 
    
    lea dx, msg2
    int 21h
    
    mov ax, 0
    mov al, n
    mov cx, 0
for1: 
    mov dx, 0
    div sc
    push dx
    inc cx
    cmp ax, 0
    jne for1
for2:
    pop dx
    add dx, '0'
    mov ah, 2
    int 21h
    loop for2
        
    mov ah, 4ch
    int 21h
main endp
End
