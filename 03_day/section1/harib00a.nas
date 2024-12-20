; hello-os
; TAB=4

    ORG     0x7c00              ; 指明程序的装载地址

; 下面这段是标准的FAT12格式软盘专用的代码

    JMP     entry               ; eb 4e
    DB      0x90
    DB      "HELLOIPL"          ; 启动区的名字可以是任意的字符串（8字节）
    DW      512                 ; 每个扇区（sector）的大小（必须为512字节）
    DB      1                   ; 簇（cluster）的大小（必须为一个扇区）
    DW      1                   ; FAT的起始位置（一般从第一个扇区开始）
    DB      2                   ; FAT的个数（必须为2）
    DW      224                 ; 根目录的大小（一般设成224项）
    DW      2880                ; 该磁盘的大小（必须是2880扇区）
    DB      0xf0                ; 磁盘的种类（必须是0xf0）
    DW      9                   ; FAT的长度（必须是9扇区）
    DW      18                  ; 1个磁道（track）有几个扇区（必须是18）
    DW      2                   ; 磁头数（必须是2）
    DD      0                   ; 不使用分区，必须是0
    DD      2880                ; 重写一次磁盘大小
    DB      0, 0, 0x29          ; 意义不明，固定
    DD      0xffffffff          ; （可能是）卷标号码
    DB      "HELLO-OS   "       ; 磁盘的名称（11字节）
    DB      "FAT12   "          ; 磁盘格式名称（8字节）
    RESB    18                  ; 先空出18字节 

; 程序主体 0x50
entry:
    MOV     AX, 0               ; 初始化寄存器 b8 00 00
    MOV     SS, AX              ; 8e d0
    MOV     SP, 0x7c00          ; bc 7c 00
    MOV     DS, AX              ; 8e d8

; 读磁盘    
    MOV     AX, 0x0820
    MOV     ES, AX
    MOV     CH, 0               ; 柱面0
    MOV     DH, 0               ; 磁头0
    MOV     CL, 2               ; 扇区2
    
    MOV     AH, 0x02            ; AH=0x02 读盘
    MOV     AL, 1               ; 1个扇区
    MOV     BX, 0               
    MOV     DL, 0x00            ; A驱动器
    INT     0x13                ; 调用磁盘BIOS
    JC      error               ; 如果出错就打印消息
    JMP     fin                 ; 否则就结束

; 读取磁盘出错
error:
    MOV     SI, msg             ;

; 0x5e
putloop:
    MOV     AL, [SI]            ; 8a 04
    ADD     SI, 1               ; 给SI加1 83 c6 01
    CMP     AL, 0               ; 3c 00

    JE      fin                 ; 74 09
    MOV     AH, 0x0e            ; 显示一个文字 b4 0e
    MOV     BX, 15              ; 指定字符颜色 bb 00 0f
    INT     0x10                ; 调用显卡BIOS cd 10
    JMP     putloop             ; eb ee

; 0x71
fin:
    HLT                         ; 让cpu停止，等待命令 f4
    JMP     fin                 ; 无限循环 eb fd

; 信息显示部分 0x74
msg:
    DB      0x0a, 0x0a          ; 2个换行
    DB      "Load Error"      ; 显示的信息 68 65 6c 6f 2c 20 77 6f 72 6c 64
    DB      0x0a                ; 换行
    DB      0

    RESB    0x7dfe-$             ; 填写0x00，直到0x001fe
    
    DB      0x55, 0xaa
