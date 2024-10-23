.model small
.stack 100h
.data
    var1 db 2
    var2 db 3
    var3 db 4
    mesg1 db 'The sum of three digits is: $'
    mesg2 db 'Answer: $'
    
.code

    main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,mesg1    ;mesg1 will be print
    mov ah,9
    int 21h
                
    mov dl,10       ;print new line
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
        
    lea dx,mesg2    ;mesg2 will be print
    mov ah,9
    int 21h
               
    call addthreenumber    ; print add answer

    mov ah,4ch
    int 21h    
    
    main endp
    
    addthreenumber proc
    
    mov dl,var1
    add dl,var2
    add dl,var3
    add dl,30h
    
    mov ah,2
    int 21h
    
    ret    
    addthreenumber endp
end main