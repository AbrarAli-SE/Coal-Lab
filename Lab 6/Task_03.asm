.model small
.stack 100h
.data
    arr db 2, 1, 3, 2        ; Array of 4 numbers
    sum db 0                 ; Variable to store the sum
.code
main proc
    mov ax, @data            ; Init data segment
    mov ds, ax

    ; Initialize sum to 0
    xor al, al               ; Clear AL (set sum to 0)

    ; Manually add the elements
    add al, [arr]            ; Add 2
    add al, [arr + 1]        ; Add 1
    add al, [arr + 2]        ; Add 3
    add al, [arr + 3]        ; Add 2

    ; Store the result in the sum variable
    mov sum, al              ; Store sum in the sum variable

    ; Display the sum
    mov dl, sum              ; Load sum into DL
    add dl, 48               ; Convert to ASCII
    mov ah, 2                ; DOS display char
    int 21h                  ; Print the character in DL

    ; Exit program
    mov ah, 4ch              ; Exit program
    int 21h
main endp
end main
