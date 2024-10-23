.model small
.stack 100h
.data
.code
main proc
    mov ax, @data            ; Init data segment
    mov ds, ax

    ; Display numbers 0 to 9
    mov cx, 10               ; Count for numbers
    mov dl, '0'              ; Start from '0'

display_numbers:
    mov ah, 2                ; DOS display char
    int 21h                  ; Print character in DL
    inc dl                   ; Next character
    loop display_numbers      ; Repeat for 10

    ; Display letters A to Z
    mov cx, 26               ; Count for letters
    mov dl, 'A'              ; Start from 'A'

display_letters:
    mov ah, 2                ; DOS display char
    int 21h                  ; Print character in DL
    inc dl                   ; Next character
    loop display_letters      ; Repeat for 26

    ; Exit program
    mov ah, 4ch              ; Exit program
    int 21h
main endp
end main
