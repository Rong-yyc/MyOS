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

ipl10.bin : ipl10.nas Makefile
	$(NASK) ipl10.nas ipl10.bin ipl10.lst

haribote.sys : haribote.nas Makefile
	$(NASK)	haribote.nas haribote.sys haribote.lst

haribote.img : ipl10.bin haribote.sys Makefile
	$(EDIMG)   imgin:../z_tools/fdimg0at.tek wbinimg \
		src:ipl10.bin len:512 from:0 to:0 copy from:haribote.sys \
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
	-del ipl10.bin
	-del ipl10.lst
	-del haribote.sys
	-del haribote.lst

src_only:
	$(MAKE) clean
	-del haribote.img