;GDT Completed
gdt_start:

gdt_null: ; mandatory null descriptor
    dd 0x0 ; 'dd' means to define a double word
    dd 0x0

gdt_code: ; The Code Segment Descriptor 
; base=0x0, limit= 0xfffff,

dw 0xffff ;Limit (bits 0 - 15)
dw 0x0 ; Base ( bits 0 - 15)
db 0x0 ; Base (bits 16-23)
db 10011010b ; 1st flags, type flags
db 11001111b ; 2nd flags, Limit  
db 0x0 ;Base (bits 24-31)

gdt_data: ; THe data segment descriptor
dw 0xffff ; Limit ( bits 0 -15 )
dw 0x0 ; Base (bits 0 -15)
db 0x0 ; Base (bits 16-23)
db 10010010b ; 1st flags, type flags
db 11001111b ; 2md flags, Limit (bits 16-19)
db 0x0 ; Base (bits 24-31)

gdt_end: ;Need label so assembler can calculate size of GDT for GDT descritpro

;GDT descriptor

gdt_descriptor:
    dw gdt_end - gdt_start - 1 ; Size of GDT, less one of true size
    dd gdt_start ; Start address of our GDT


  CODE_SEG equ gdt_code - gdt_start
  DATA_SEG equ gdt_data - gdt_start



