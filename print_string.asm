print_string: 
    pusha 
    mov ah, al
    int 0x10
    popa  
    ret 
