; haribote-os
; TAB=4

    ORG     0xc200                  ;这个程序将要被装载到内存的什么地方呢？

    MOV     AL, 0x13                ; VGA显卡 680 * 480 256色
    MOV     AH, 0x00                ; 入口参数
    INT     0x10
    
fin:
    HLT
    JMP     fin