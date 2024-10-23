.model small        ; Reserve memory
.stack 100h
.data               ; Data segment

    num1 db 2       ; num1=2
    num2 db 3       ; num2=3
    num3 db 4       ; num3=4
    result db 0     ; result=0

.code

    main proc
        mov ax, @data   ; Initialize data segment
        mov ds, ax

        ;(AL lower gernal register)
        mov al, num1    ; num1 into AL
        add al, num2    ; Add num2
        add al, num3    ; Add num3

 
        mov result, al  ; Move the result into result

 
        add al, 30h     ; Convert the result to ASCII
        mov dl, al      ; Move the result to DL for printing
        mov ah, 2       ; print result
        int 21h         ; interrupt

        ; Exit the program
        mov ah, 4Ch     ; Terminate program
        int 21h         ; interrupt
    main endp

end main
