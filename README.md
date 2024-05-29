# c++操作系统

##### 需要使用linux系统下运行

- 设置一下基本的堆栈空间-用来加载程序

```assembly
; 占用2M的内存用来执行
.space 2*1024*1024 
```

- 无限循环防止跳出我们设置的运行位置

```assembly
; 无限循环、防止我们跳出kernalMain
_stop:
    cli
    hlt
    jmp _stop

```

- 内核认证

```assembly
内核识别码:0x1badb002
这样引导程序才能将其作为内核接受

.set MAGIC, 0x1badb002
.set FLAGS,(1<<0 | 1<<1)
.set CHECKSUM,-(MAGIC+FLAGS)


.section .multiboot
    .long MAGIC
    .long FLAGS
    .long CHECKSUM
```

- 使用GNU的MultipleBoot Structure、传递magicnumber

```cpp
void kernelMain(void* multiboot_structure,unsigned int magicnumber )
{
    printf("Hello world!");
    while(1);
}
```

##### 第一次编译

- git 推送权限

```
1.需要产生对应的公钥并把公钥放到git 远端服务器上（github）上、才能有权推送数据

0.需要设置用户名和邮箱、随意都行
	git config --global user.name "username"
	git config --global user.email "email.com"
	
	ssh-keygen -t rsa -C "xxx@xxx.com"
	疯狂回车
	cd ~/.ssh
	cat id_rsa.pub
	
2.去Github上增加公钥
	settings.SSH keys增加即可
```

