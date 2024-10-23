 .model small        ;reserve memory
 .stack 100h
 .data               ; portion to store vwriables or to store data
 
   var1 db 0
 
 .code
 
      main proc
      mov ax, @data  ;to get the adress of data segment
      mov ds, ax     ; to access all veriables that we store in data portion in code portion
        
      mov ah,1       ;service routine to take inputs from user
      int 21h        ;intreupt of service routine
                     ;input will be store in al register
                     
      mov var1,al    ;to store inout in veriabels            
                
      mov ah,4ch     ;service routine pre defined functions
      int 21h        ; to exit the program  
      main endp
 
 end main               