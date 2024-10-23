.model small
.stack 100h
.data 

    string db 'Abrar Ali$'
    mesg1 db 'Orignal String: $'
    mesg2 db 'Reversed String: $'
.code
    main proc
        
        mov ax,@data
        mov ds,ax
        
        lea dx,mesg1    ;mesg1 will be print
        mov ah,9
        int 21h
        
        lea dx,string   ;orignal will be print 
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
               
        call reverse    ; reverse string


        mov ah,4ch
        int 21h
    main endp
    reverse proc
        
        lea ax,string
        mov si,ax
        
        mov cx,9
        l1:
        
        push [si]
        inc si
        
        
        loop l1
        
        mov cx,9
        l2:
        
        pop dx
        mov ah,2
        int 21h
        
        loop l2
       
        ret    
    reverse endp    
end main