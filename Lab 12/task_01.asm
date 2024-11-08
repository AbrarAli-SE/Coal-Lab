section.data
    msg db 'OK',
    0;
'OK' with null terminator

    section.text
        global _start; Entry point for the linker

_start:
    mov eax, 4       ; Syscall number for sys_write (Linux)
    mov ebx, 1       ;
File descriptor 1(stdout)
    mov ecx,
    msg;
Message to print
    mov edx,
    2;
Message length int 0x80;
Call kernel

    mov eax,
    1; Syscall number for sys_exit
    xor ebx, ebx     ;
Return 0 status int 0x80;
Call kernel
