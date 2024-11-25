# 默认动作

default :
	../z_tools/make.exe img

# 文件生成规则

harib00a.bin : harib00a.nas Makefile
	../z_tools/nask.exe harib00a.nas harib00a.bin harib00a.lst

helloos.img : harib00a.bin Makefile
	../z_tools/edimg.exe   imgin:../z_tools/fdimg0at.tek \
		wbinimg src:harib00a.bin len:512 from:0 to:0   imgout:helloos.img

# 命令
img :
	../z_tools/make.exe -r helloos.img

asm :
	../z_tools/make.exe -r harib00a.bin

run :
	../z_tools/make.exe img
	copy helloos.img ..\z_tools\qemu\fdimage0.bin
	..\z_tools\make.exe -C ../z_tools/qemu

install :
	../z_tools/make.exe img
	..\z_tools\imgtol.com w a: helloos.img

clean :
	-del harib00a.bin
	-del harib00a.lst

src_only:
	../z_tools/make.exe clean
	-del helloos.img