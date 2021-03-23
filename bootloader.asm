[org 0x7c00]

mov bp, 0x9000 ; Set-up the stack
mov sp, bp

mov bx, MSG_REAL_MODE ; Announce we are starting to boot from 160but real mode

call print_string
call switch_to_pm

jmp $

%include "print_string.asm"
%include "gdt.asm"
%include "print_string_pm.asm"
%include "switch_to_pm.asm"

[bits 32]

;After switching to protected mode

BEGIN_PM:

    mov ebx, MSG_PROT_MODE
    call print_string_pm ;Use 32-bit print routine

   jmp $

MSG_REAL_MODE db "Started in 16-bit Real Mode", 0
MSG_PROT_MODE db "Succesfully landed in 32-bit Protected Mode", 0

times 510-($-$$) db 0
dw 0xaa55
