; haribote-os
; TAB=4

    ORG     0xc200                  ;这个程序将要被装载到内存的什么地方呢？
    
fin:
    HLT
    JMP     fin