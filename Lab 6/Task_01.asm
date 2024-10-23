.model small
.stack 100h
.data
    arr db 4,1,3,5,6,7       ; Array of numbers
    arr2 db 'a','b','c','g'  ; Array of characters
.code
main proc
    mov ax, @data            ; Init data segment
    mov ds, ax

    lea si, arr              ; Load array address into SI
    mov cx, 6                ; Loop count (6 elements)

display_loop:
    mov dl, [si]             ; Get value from array
    add dl, 48               ; Convert to ASCII
    mov ah, 2                ; DOS interrupt to display char
    int 21h                  ; Display character

    inc si                   ; Next element
    loop display_loop        ; Repeat until done

    mov ah, 4ch              ; Exit program
    int 21h
main endp
end main
