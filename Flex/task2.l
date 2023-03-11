%{
#include <stdio.h>

int NumOfChar = 0, NumOfWord = 0, NumOfLine = 0;
%}

%option noyywrap

%%

[a-zA-Z]+[a-zA-Z]+[a-zA-Z]* {
    NumOfChar += yyleng;
    ++NumOfWord;
}//字母串且长度大于1，则按照描述认定为单词，并将单词长度全部计入字符

[1-9]+[1-9]+[1-9]* {
    NumOfChar += yyleng;
    ++NumOfWord;
}//数字串且长度大于1，则按照描述认定为单词，并将单词长度全部计入字符。
//此处题干描述存疑，我们是否应当将数字与字母的混合作为单词？是否应当将符合单词描述但前后有标点的字符串不作为单词处理？

\n {
    ++NumOfChar;
    ++NumOfLine;
}//将换行符计入字符并进行行数的自增

. {
    ++NumOfChar;
}//将不符合以上条件的均记作字符

%%

int main() {
    yylex();
    printf("%d\t%d\t%d\n", NumOfChar, NumOfWord, NumOfLine);
    return 0;
}
