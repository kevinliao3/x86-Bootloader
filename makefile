WTF: basic.c
	gcc -ffreestanding -c basic.c -o basic.o


kernel: kernel.c
	gcc -ffreestanding -c kernel.c -o kernel.o
	ld -o kernel.bin -Ttext 0x1000 kernel.o --oformat binary  

	
nasm: bootloader.asm
	nasm bootloader.asm -f bin -o boot.bin 

run:
	qemu-system-x86_64 -fda boot.bin