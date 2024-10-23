.model small
.stack 100h

.data
    numbers dw 1, 2, 3, 4, 5       ; 5 integers

.code
main proc
    mov ax, @data                   ; Init data segment
    mov ds, ax

    lea si, numbers                 ; Load address of numbers
    mov cx, 5                       ; Counter for 5 integers

push_loop:
    mov ax, [si]                    ; Load number
    push ax                         ; Push onto stack
    add si, 2                       ; Next number
    loop push_loop

    mov bp, sp                      ; Store SP in BP

    mov cx, 5                       ; Counter for 5 pops

pop_loop:
    pop ax                          ; Pop from stack
    loop pop_loop

    mov sp, bp                      ; Reset stack using BP

    mov ah, 4ch                     ; Exit
    int 21h

main endp
end main
