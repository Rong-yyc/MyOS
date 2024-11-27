/* 告诉 C 编译器，有一个函数在别的文件里 */
void io_hlt(void);

/* 是函数声明，却不用{}，而是直接 ; ，这表示函数是在别的文件中，你自己找一下把*/
void HariMain(void)
{
fin:
    io_hlt(); /*执行naskfunc.nas里的_io_hlt*/
    goto fin;
}
