.model small
.stack 100h
.data
    str db 'Abrar Ali$'        ; Original string
    reversedStr db 20 dup(0)   ; Buffer for reversed string
.code
main proc
    mov ax, @data              ; Init data segment
    mov ds, ax

    ; Push characters onto the stack
    lea si, str                ; Load original string
    push_count:                ; Counter for characters
    mov cx, 0                  ; Initialize character count

push_loop:
    mov al, [si]               ; Load character
    cmp al, '$'                ; Check for terminator
    je pop_loop                ; Jump if end reached
    push ax                    ; Push character onto stack
    inc si                     ; Next character
    inc cx                     ; Increment character count
    jmp push_loop              ; Repeat

pop_loop:
    lea di, reversedStr        ; Load buffer for reversed string
    pop_char:
    cmp cx, 0                  ; Check if all characters popped
    je display                 ; Jump to display if done
    pop ax                     ; Pop character
    mov [di], al              ; Store in reversed string
    inc di                     ; Next position
    dec cx                     ; Decrement character count
    jmp pop_char               ; Repeat

display:
    mov byte ptr [di], '$'    ; Null-terminate reversed string

    ; Display original string
    lea dx, str                ; Load original string
    mov ah, 09h                ; DOS function to display
    int 21h                    ; Call DOS interrupt

    ; Display reversed string
    lea dx, reversedStr        ; Load reversed string
    mov ah, 09h                ; DOS function to display
    int 21h                    ; Call DOS interrupt

    mov ah, 4ch                ; Exit program
    int 21h
main endp
end main
