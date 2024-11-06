;---------------------------------- In ra man hinh sau ki tu theo dieu kien -----------------------------------
; Ngo Quy Truong Giang - B23DCAT080
; Tran Duy Anh - B23DCAT020
; Vu Do Phuong Dong - B23DCAT045
; Le Hong Son - B23DCAT260

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
    ; In ra xau ki tu yeu cau
    mov ah, 9
    lea dx, msg
    int 21h
    ; Nhap du lieu vao thanh ghi AL
    mov ah, 1
    int 21h
    mov datain, al ;Chuyen du lieu thanh ghi al vao bien datain 
    ; In ra dau xuong dong 
    mov ah, 9
    lea dx, endline
    int 21h
    cmp datain, '0'; So sanh du lieu voi ki tu '0'
    je VIETNAM ; Nhay neu bang
    
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
