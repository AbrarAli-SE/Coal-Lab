.model small
.stack 100h
.data
    num1 db 5               ; First number
    num2 db 10              ; Second number
.code
main proc
    mov ax, @data           ; Initialize data segment
    mov ds, ax

    ; Push numbers onto the stack
    mov al, [num1]          ; Load first number
    push ax                 ; Push first number onto stack
    mov al, [num2]          ; Load second number
    push ax                 ; Push second number onto stack

    ; Swap numbers
    pop ax                  ; Pop second number into AL
    mov [num1], al         ; Store it in num1
    pop ax                  ; Pop first number into AL
    mov [num2], al         ; Store it in num2

    ; Exit program
    mov ah, 4ch             ; DOS function to exit
    int 21h
main endp
end main
