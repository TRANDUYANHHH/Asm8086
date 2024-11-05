.model small
.stack 100h
.data 
    arr db -11, 2, 3, -4, 5, 6, -7, 8, 9, -10
    sum db 0
.code
main proc
    mov ax, @Data
    mov ds, ax
    
    mov ax, 0
    lea si, arr
    mov cx, 10
tong:
    lodsb
    cmp al, 0
    jge pass
    mov bl, 0
    sub bl, al 
    add sum, bl
pass:
    loop tong
    
    mov dl, '-'
    mov ah, 2
    int 21h
    
    mov ah, 0
    mov al, sum
    call print
    
    mov ah, 4ch
    int 21h
main endp  

print proc
    mov bx, 10
    mov cx, 0
chia:
    mov dx, 0
    div bx
    push dx
    inc cx
    cmp ax, 0
    je hienthi
    jmp chia
hienthi:
    pop dx
    add dl, '0'
    mov ah, 2
    int 21h
    dec cx
    cmp cx, 0
    jne hienthi
    ret
print endp
