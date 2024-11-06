;---------------------------------- Tinh tong cac so am cua mot day so nguyen cho truoc trong Data segment -----------------------------------
; Ngo Quy Truong Giang - B23DCAT080
; Tran Duy Anh - B23DCAT020
; Vu Do Phuong Dong - B23DCAT045
; Le Hong Son - B23DCAT260
.model small
.stack 100h
.data 
    arr db -11, 2, 3, -4, 5, 6, -7, 8, 9, -10 ; Mang cac phan tu nguyen
    sum db 0
.code
main proc
    mov ax, @Data
    mov ds, ax
    
    mov ax, 0
    lea si, arr; load dia chi cua mang arr len thanh ghi si
    mov cx, 10 ; dat thanh ghi cx = 10 - so phan tu cua mang
tong:
    lodsb      ; load 1 byte cua tro boi thanh ghi si len al
    cmp al, 0  ; so sanh al voi 0
    jge pass   ; neu gia al >= 0 thi bo qua khong cong vao ket qua
    mov bl, 0  
    sub bl, al ; bl la gia tri tuyet doi cua al
    add sum, bl; cong vao tong
pass:
    loop tong
    ; Ta co duoc trong cua cac phan tu am (Tri tuyet doi)
    mov dl, '-'
    mov ah, 2
    int 21h    ; In ra dau tru
    
    mov ah, 0  ; Gan gia tri cua sum cho ax 
    mov al, sum; vi sum co 8 bit nen ta se gan thanh al = sum va ah = 0
    call print ; goi ham print
    
    mov ah, 4ch; ngat chuong trinh
    int 21h
main endp  

print proc
    mov bx, 10; gan bx bang so chia
    mov cx, 0 ; su dung cx de luu do dai cua so
chia:
    mov dx, 0 ; voi phep chia 16 bit, dx se luu phan du cua phep chia, ax luu phan nguyen
    div bx
    push dx   ; day phan du vao stack
    inc cx    ; tang cx len 1
    cmp ax, 0 ; neu ax = 0 thi ta ket thuc vong lap
    je hienthi
    jmp chia
hienthi:
    pop dx    ; lay phan tu dau tien ra khoi stack
    add dl, '0'; gan cho dl de chuan bi in ra man hinh
    mov ah, 2  
    int 21h
    dec cx     ; giam cx di 1
    cmp cx, 0  ; neu cx = 0 thi ta ket thuc chuong trinh
    jne hienthi
    ret
print endp
