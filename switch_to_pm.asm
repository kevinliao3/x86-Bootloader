[bits 16]

;Switch to Protected mode 

switch_to_pm:
    
    cli ;This sets the interrupt flag to 0, which disables interrupts 

    lgdt [gdt_descriptor] ; Load the global descriptor table

    mov eax, cr0 ; Take control of CR0, a control register
    or eax, 0x1
    mov cr0, eax ;We set the first bit of CR0, a control register

    jmp CODE_SEG:init_pm


[bits 32]

init_pm:
;
;In PM, old segments are meaningless so point segment registers to data selector defnied in our GDT
;
mov ax, DATA_SEG
mov ds, ax
mov ss, ax
mov es, ax
mov fs, ax
mov gs, ax

mov ebp, 0x90000 ;Update stack position so it is at the top of the free space
mov esp, ebp

call BEGIN_PM

    