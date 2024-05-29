# 设置常量
GPPPARAMS= -m32 #GPP参数
ASPARAMS= --32  #汇编参数
LDPARAMS= --melf_i386 #BootLoader参数
# 产出结果文件
objects= loader.o kernel.o
# 所有.cpp 将会变为.o
%.o:%.cpp
	g++ $(GPPARAMS) -o $@ -c $<  
%.o:%.s
	as $(ASPARAMS) -o $@ $<
mykernel.bin: linker.ld $(objects)
	ld $(LDPARAMS) -T $< -o $@ $(objects)

# 安装:sudo cp mykernel.bin /boot/mykernel.bin
install: mykernel.bin
	sudo cp $< /boot/mykernel.bin
