.model small
.stack 100h
.data
    msg db 'Type your input: $'
    nline db 13, 10, '$'
    msg2 db 'Answer: $'
    num db 10 dup('$') 
    sum dw 0
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg
    int 21h
    
    mov ah, 10
    lea dx, num
    int 21h
    
    mov cx, 0
    mov cl, [num + 1]
    lea si, num + 2
for:
    mov bx, 0
    mov bl, [si] 
    sub bl, '0'
    inc si
    add sum, bx    
    loop for
    ;calc sum  
    
    mov ax, sum
    mov cx, 0
    mov bx, 10
    
    ;push to stack
for2:
    mov dx, 0
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne for2
    
    ;pop from stack
    mov ah, 9
    lea dx, nline
    int 21h
    
    lea dx, msg2
    int 21h
for3:
    pop dx
    add dx, '0'
    mov ah, 2
    int 21h
    loop for3 
    
    ;return 0
    mov ah, 4ch
    int 21h
main endp
