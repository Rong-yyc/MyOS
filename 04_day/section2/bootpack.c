/* 告诉 C 编译器，函数在别的文件里 */
void io_hlt(void);
void write_mem8(int addr, int data);

/* 是函数声明，却不用{}，而是直接 ; ，这表示函数是在别的文件中，你自己找一下把*/
void HariMain(void)
{
    int i; // 变量声明：i 是一个32位整数

    for (i = 0xa0000; i <= 0xaffff; i++)
    {
        write_mem8(i, i & 0x0f); /* MOV BYTE [i],15*/
    }

    for (;;)
    {
        io_hlt();
    }
}
