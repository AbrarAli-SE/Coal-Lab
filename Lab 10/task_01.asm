
display macro var
    
    lea dx, var      
    mov ah, 9        
    int 21h          
endm

.model small
.stack 100h
.data
var1 db "Abrar$"
var2 db "Ali$"
.code
main proc
    
    mov ax, @data
    mov ds, ax
    
    display var1
    
    call newLine
    
    display var2
    
    mov ah,4ch
    int 21h
    
main endp

    newLine proc
        
    mov dl,13
    mov ah,2
    int 21h
    
    mov dl,10
    mov ah,2
    int 21h
    
    ret    
    newLine endp


end main