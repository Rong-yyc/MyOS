/* 告诉 C 编译器，函数在别的文件里 */
void io_hlt(void);

/* 是函数声明，却不用{}，而是直接 ; ，这表示函数是在别的文件中，你自己找一下把*/
void HariMain(void)
{
    int i;   // 变量声明：i 是一个32位整数
    char *p; // 变量 p 是用于内存地址的专用变量，用于 byte 型地址

    for (i = 0xa0000; i <= 0xaffff; i++)
    {
        p = (char *)i;
        *p = i & 0x0f; /* MOV BYTE [p],i & 0x0f*/

        /*以上就可以替代 write_mem8(i, i & 0x0f);*/
    }

    for (;;)
    {
        io_hlt();
    }
}
