;---------------------------------- Nhap vao 1 ki tu va in ra ki tu in hoa -----------------------------------
; Ngo Quy Truong Giang - B23DCAT080
; Tran Duy Anh - B23DCAT020
; Vu Do Phuong Dong - B23DCAT045
; Le Hong Son - B23DCAT260

.model small
.stack 100h
.data 
    char db 'A'
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
