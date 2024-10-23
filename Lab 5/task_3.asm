.model small        ; Reserve memory
.stack 100h
.data               ; Data segment

    Var1 db 23      ; Var1 = 23
    Var2 db 65      ; Var2 = 65

.code

    main proc
        mov ax, @data   ; Initialize data segment
        mov ds, ax

        ; AL(lower part of a) 
        ; BL(lower part of b)
        
        mov al, Var1    ; Load Var1 into AL
        mov bl, Var2    ; Load Var2 into BL

        ; Swap the values
        mov Var1, bl    ; Move BL (Var2) into Var1
        mov Var2, al    ; Move AL (Var1) into Var2

        ; Exit the program
        mov ah, 4Ch     ; Terminate program
        int 21h         ; interrupt
     main endp

end main
