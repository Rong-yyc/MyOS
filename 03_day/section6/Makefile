# 一些变量
TOOLPATH = ../z_tools/
MAKE = $(TOOLPATH)make.exe -r
NASK = $(TOOLPATH)nask.exe
EDIMG= $(TOOLPATH)edimg.exe
IMGTOL=$(TOOLPATH)imgtol.com

# 默认操作

default:
	$(MAKE) img

# 文件生成规则

ipl.bin : ipl.nas Makefile
	$(NASK) ipl.nas ipl.bin ipl.lst

haribote.sys : haribote.nas Makefile
	$(NASK)	haribote.nas haribote.sys haribote.lst

haribote.img : ipl.bin haribote.sys Makefile
	$(EDIMG)   imgin:../z_tools/fdimg0at.tek wbinimg \
		src:ipl.bin len:512 from:0 to:0 copy from:haribote.sys \
		to:@: imgout:haribote.img

# 命令

img :
	$(MAKE) haribote.img

run :
	$(MAKE) img
	copy haribote.img ..\z_tools\qemu\fdimage0.bin
	$(MAKE) -C ../z_tools/qemu

install :
	$(MAKE) img
	$(IMGTOL) w a: haribote.img

clean:
	-del ipl.bin
	-del ipl.lst
	-del haribote.sys
	-del haribote.lst

src_only:
	$(MAKE) clean
	-del haribote.img