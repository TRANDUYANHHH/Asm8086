.Model Small

.Stack 100H

.Data
    char db 'A'; ki tu trong data segment
    nl db 13, 10, '$';xuong dong
.Code
Main Proc
    ;Khoi tao doan du lieu
    mov ax, @Data
    mov ds, ax   
    
    cmp char, 'Z'; so sanh char voi ki tu Z
    jle OUTPUT; Neu nho hon hoac bang, tuc la ki tu in hoa ta nhay den nhan OUTPUT de in ra man hinh
    sub char, 32; Khong thi ta se tru ki tu di 32 (chuyen ve in hoa)
    
OUTPUT:
    mov dl, char
    mov ah, 2
    int 21h
    
    mov ah, 4ch
    int 21h 
Main Endp
end
