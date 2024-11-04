.model Small

.stack 100

.data
    msg db 'Nhap 1 ky tu: $'
    nl db 13, 10, '$'
    din db ?
.code
main proc
   mov ax, @data
   mov ds, ax
   
   mov ah, 9
   lea dx, msg
   int 21h
   
   ;nhap ki tu vao thanh al
   mov ah, 1
   int 21h
   mov din, al
   
   mov ah, 9
   lea dx, nl
   int 21h
   
   mov dl, din
   mov ah, 2
   int 21h
      
   mov ah, 4ch
   int 21h
main endp
end
