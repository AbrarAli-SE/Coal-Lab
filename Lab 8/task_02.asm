.model small
.stack 100h

.data
    fib db 6 dup(0)            ; Array to store Fibonacci numbers

.code
main proc
    mov ax, @data              ; Initialize data segment
    mov ds, ax

    mov al, 0                  ; First Fibonacci number (0)
    mov [fib], al              
    mov al, 1                  ; Second Fibonacci number (1)
    mov [fib + 1], al         

    ; Push first two numbers onto the stack
    push ax                    ; Push 1 onto the stack (2nd number)
    push 0                     ; Push 0 onto the stack (1st number)

    mov cx, 4                  ; Loop for remaining 4 Fibonacci numbers
    mov di, 2                  ; DI to track the current position in the fib array

generate_fib:
    pop bx                     ; BX = last number
    pop ax                     ; AX = second last number

    add ax, bx                 ; AX = AX + BX (new Fibonacci number)
                                                 
    mov [fib + di], al         ; Store in the fib arrayx
    inc di                     ; Move to the next index

    push bx                    ; Push last number back
    push ax                    ; Push new Fibonacci number

    loop generate_fib          ; Repeat for 4 more numbers

display_fib:
    lea si, fib                ; Load address of fib array

display_loop:
    mov al, [si]               ; Load each Fibonacci number
    add al, '0'                ; Convert to ASCII
    mov dl, al                 ; Move to DL for printing
    mov ah, 2h                 ; DOS interrupt for printing character
    int 21h                    ; Print the character

    inc si                     ; Move to the next Fibonacci number
    cmp si, offset fib + 6      ; Check if all numbers are displayed
    jne display_loop           ; If not, repeat

    mov ah, 4ch                ; Exit program
    int 21h

main endp
end main
