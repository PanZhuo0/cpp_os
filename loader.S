et MAGIC, 0x1badb002
.set FLAGS,(1<<0 | 1<<1)
.set CHECKSUM,-(MAGIC+FLAGS)


.section .multiboot
    .long MAGIC
    .long FLAGS
    .long CHECKSUM

.section .text
; extern 调用外部的kernelMain
.extern kernelMain
; 全局- 这是一个loader
.global loader

loader:
; 需要移动堆栈指针
    mov $kernel_stack,%esp
    ; 调用kernelMain 
    call kernelMain

; 无限循环、防止我们跳出kernalMain
_stop:
    cli
    hlt
    jmp _stop

.section .bass
; 占用2M的内存用来执行
.space 2*1024*1024 #
kernel_stack:

