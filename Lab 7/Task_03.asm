.model small
.stack 100h
.data
    arr db 4, 1, 9, 5, 6, 2  ; Array of integers
    size db 6                 ; Size of the array
.code
main proc
    mov ax, @data             ; Init data segment
    mov ds, ax

    lea si, arr               ; Address of array
    mov cl, [size]            ; Size in CL

    ; Push elements onto the stack
push_loop:
    mov al, [si]              ; Load element
    push ax                   ; Push onto stack
    inc si                    ; Next element
    dec cl                    ; Decrement count
    jnz push_loop             ; Repeat

    ; Initialize largest
    pop ax                    ; First element to AX
    mov bl, al                ; Set largest in BL
    
    ; Find largest element
find_largest:
    cmp cl, 0                 ; Check count
    je done                   ; If zero, done

    pop ax                    ; Next element
    cmp al, bl                ; Compare with largest
    jle skip                  ; If =, skip
    mov bl, al                ; Update largest

skip:
    dec cl                    ; Decrement count
    jmp find_largest          ; Continue

done:
    ; BL contains largest element
    mov ah, 4ch               ; Exit program
    int 21h
main endp
end main
