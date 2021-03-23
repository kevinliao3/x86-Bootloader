[bits 32]

VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

print_string_pm:
    pusha
    mov edx, VIDEO_MEMORY

print_string_pm_loop:
    mov al, [ebx]       ;Store the char at EBX in AL
    mov ah, WHITE_ON_BLACK ;Store the attributes in AH

    cmp al, 0 ;If (al == 0), at end of stringm jump to done
    je print_string_pm_done

    mov [edx], ax ;Store char and attributes at current character cell

    add ebx, 1 ;Increment EBX to next char in string
    add edx, 2 ;Move to next character cell in vid mem

    jmp print_string_pm_loop ;loop around to print the next char

print_string_pm_done:
    popa
    ret ;Return from the function
