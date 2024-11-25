# 默认动作

default :
	../z_tools/make.exe img

# 文件生成规则

harib00c.bin : harib00c.nas Makefile
	../z_tools/nask.exe harib00c.nas harib00c.bin harib00c.lst

helloos.img : harib00c.bin Makefile
	../z_tools/edimg.exe   imgin:../z_tools/fdimg0at.tek \
		wbinimg src:harib00c.bin len:512 from:0 to:0   imgout:helloos.img

# 命令
img :
	../z_tools/make.exe -r helloos.img

asm :
	../z_tools/make.exe -r harib00c.bin

run :
	../z_tools/make.exe img
	copy helloos.img ..\z_tools\qemu\fdimage0.bin
	..\z_tools\make.exe -C ../z_tools/qemu

install :
	../z_tools/make.exe img
	..\z_tools\imgtol.com w a: helloos.img

clean :
	-del harib00c.bin
	-del harib00c.lst

src_only:
	../z_tools/make.exe clean
	-del helloos.img