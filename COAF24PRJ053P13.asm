.model small
.stack 100h
.data 
    char db 'C'
.code
main proc
    mov ax, @Data
    mov ds, ax   
   
    cmp char, 'Z'
    jle print
    sub char, 32
print:
    mov dl, char
    mov ah, 2
    int 21h
main endp
end 
