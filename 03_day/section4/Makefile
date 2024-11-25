# 默认动作

default :
	../z_tools/make.exe img

# 文件生成规则

harib00d.bin : harib00d.nas Makefile
	../z_tools/nask.exe harib00d.nas harib00d.bin harib00d.lst

helloos.img : harib00d.bin Makefile
	../z_tools/edimg.exe   imgin:../z_tools/fdimg0at.tek \
		wbinimg src:harib00d.bin len:512 from:0 to:0   imgout:helloos.img

# 命令
img :
	../z_tools/make.exe -r helloos.img

asm :
	../z_tools/make.exe -r harib00d.bin

run :
	../z_tools/make.exe img
	copy helloos.img ..\z_tools\qemu\fdimage0.bin
	..\z_tools\make.exe -C ../z_tools/qemu

install :
	../z_tools/make.exe img
	..\z_tools\imgtol.com w a: helloos.img

clean :
	-del harib00d.bin
	-del harib00d.lst

src_only:
	../z_tools/make.exe clean
	-del helloos.img