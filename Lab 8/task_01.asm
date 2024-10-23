.model small
.stack 100h
.data
    str db 'Abrar$', 0        ; String

.code
main proc
    mov ax, @data             ; Init data segment
    mov ds, ax

    lea si, str               ; Load string address
    lea di, str               ; Load end address

find_end:
    inc di                    ; Find end
    cmp byte ptr [di], '$'    
    jne find_end
    dec di                    ; Move to last char

reverse_string:
    mov cx, di                ; CX = end
    sub cx, si                ; CX = (end - start)
    shr cx, 1                 ; Half of length

reverse_loop:
    cmp cx, 0                 ; Check if done
    jz display_string

    mov al, [si]              ; Swap start with end
    mov bl, [di]
    mov [si], bl
    mov [di], al

    inc si                    ; Move pointers
    dec di
    loop reverse_loop         

display_string: 
    lea si, str               ; Reload string
display_loop:
    mov al, [si]              ; Load char
    cmp al, '$'               ; Check end
    je done
    mov dl, al                ; Print char
    mov ah, 2h
    int 21h
    inc si                    ; Move to next char
    jmp display_loop

done:
    mov ah, 4ch               ; Exit
    int 21h

main endp
end main
