 .model small        ;reserve memory
 .stack 100h
 .data               ; portion to store vwriables or to store data
 
   masg  DB "Hello  World :$"      ;to store a mesg in a veriable
 
 .code
 
      main proc 
        
      mov ax, @data  ;to get the adress of data segment
      mov ds, ax     ; to access all veriables that we store in data portion in code portion
      
      ;now we need to convert veriable to a data register to print data  
      ;for this purpose we can use LEA OR OFFSET
      ;if we write lea then syntax will be LEA DX,MSG
      ;mov dx offset,msg
      
      
      lea dx, masg
        
      mov ah,9       ;service routine to for string data
      int 21h        ;intreupt of service routine
                     
                                                             
                
      mov ah,4ch     ;service routine pre defined functions
      int 21h        ; to exit the program  
      main endp
 
 end main               