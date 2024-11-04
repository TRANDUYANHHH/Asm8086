.model Small

.stack 100h

.data            
    msg db 'Nhap so vao: $'
    chao1 db 'Xin chao!$'
    chao2 db 'Nimen hao!$'
    endline db 13, 10, '$'
    datain db ?
.code
main proc
    mov ax, @Data
    mov ds, ax
   
    ; In ye^u cau' ra man' hinh'
    mov ah, 9
    lea dx, msg
    int 21h
    ;Nha^p du? lie^u vao thanh ghi AL
    mov ah, 1
    int 21h
    mov datain, al ;Chuyen du lieu thanh ghi al vao bien datain 
    ; In ra dau xuong dong 
    mov ah, 9
    lea dx, endline
    int 21h
    sub datain, '0'
    jz VIETNAM
    
    mov ah, 9
    lea dx, chao2
    int 21h
    jmp FINISH

VIETNAM:
    mov ah, 9
    lea dx, chao1
    int 21h
    
FINISH:
        
    mov ah, 4ch
    int 21h
main endp
end
