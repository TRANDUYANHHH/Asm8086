.Model Small
.Stack 100h
.Data
    arr db 1, -2, 4, -3, 5, -7, -9, -1, 3, 2
    sum db 0
    num db 10 dup('$')
.Code
main proc
    mov ax, @Data
    mov ds, ax
      
    lea si, arr; load dia chi cua arr len si
    mov cx, 10; dat cx = 10 (so phan tu cua mang)
    ; Vong lap tinh tong cac gia tri am (Tri tuyet doi)
lp1:
    lodsb ; chuyen gia tri 1 byte cua thanh ghi si -> al
    cmp al, 0; so sanh al voi gia tri 0
    jge pass ; nhay den vong lap moi neu al >= 0
    mov bl, 0; gan bl = 0
    sub bl, al; gan bl = bl - al hay bl = -al
    add sum, bl; cong don bl vao sum
pass:
    loop lp1
    
    ;Xu ly ket qua thanh 1 chuoi de in ra man hinh
    mov ax, 0
    mov al, sum
    mov bl, 10
    ;in ra dau am
    mov dl, '-'
    mov ah, 2
    int 21h
    ; Bat dau so thanh xau ki tu
    mov al, sum
lp2:
    mov bl, 10
    div bl
    mov dl, ah
    add dl, '0'
    mov ah, 2
    int 21h  
    mov ah, 0
    mov al, al
    cmp al, 0
    jne lp2
end_lp2: 
    mov ah, 4ch
    int 21h
main endp
end
