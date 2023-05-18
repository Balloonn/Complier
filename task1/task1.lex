%option noyywrap
%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<string.h>
    #include<math.h>

    #define SYMBOL 1
    #define IDN 2
    
    #define INT8 3
    #define INT10 4
    #define INT16 5
    #define FLOAT8 6
    #define FLOAT10 7
    #define FLOAT16 8

    #define IF 9
    #define THEN 10
    #define ELSE 11
    #define WHILE 12
    #define DO 13

    int yylval;
%}

letter [a-zA-Z]
digit [0-9]
hex [0-9a-f]
idn {letter} ({letter}|{digit})* ([_.]({letter}|{digit})+)?
symbol [+]|[-]|[*]|[/]|[>]|[<]|[=]|[(]|[)]|[;]

int8 0 [0-7]+
int10 0|([1-9]{digit}*)
int 16 0x{hex}+

float8 0[0-7]+[.][0-7]+
float10 (0|[1-9]{digit}*)[.]{digit}+
float16 0x{hex}+[.]{hex}+

%%
{symbol}    {return SYMBOL;}
{idn}       {return IDN;}
{int8}    
{int10}     {return INT10;}
{int16}     {return INT16;}
{float8}    {return FLOAT8;}
{float10}   {return FLOAT10;}
{float16}   {return FLOAT16;}

if          {return IF;}
then        {return THEN;}
else        {return ELSE;}
while       {return WHILE;}
do          {return DO;}
.           {;}
%%

int otod(char *p);
int dtod(char *p);
int htod(char *p);
char* fotod(char *p);
char* fdtod(char *p);
char* fhtod(char *p);


void myprint(int c, FILE* fp) {
    switch(c) {
        case SYMBOL: 
            printf("%s\t\t_\n", yytext); 
            fprintf(fp, "%s\t\t_\n", yytext);
            break;
        case IDN: 
            printf("IDN\t\t%s\n", yytext);
            fprintf(fp, "IDN\t\t%s\n", yytext);
            break;
        case INT8:
            printf("INT8\t\t%d\n", otod(yytext));
            fprintf(fp, "INT8\t\t%d", otod(yytext));
            break;
        case INT10:
            printf("INT10\t\t%d\n", dtod(yytext));
            fprintf(fp, "INT10\t\t%d", dtod(yytext));
            break;
        case INT16:
            printf("INT16\t\t%d\n", htod(yytext));
            fprintf(fp, "INT16\t\t%d", htod(yytext));
            break; 
        case FLOAT8:
            printf("FLOAT8\t\t%s\n", fotod(yytext));
            fprintf(fp, "FLOAT8\t\t%s\n", fotod(yytext));
            break;
        case FLOAT10:
            printf("FLOAT10\t\t%s\n", fdtod(yytext));
            fprintf(fd, "FLOAT10\t\t%s\n", fdtod(yytext))
            break;
        case FLOAT16:
            printf("FLOAT16\t\t%s\n", fhtod(yytext));
            fprintf(fd, "FLOAT16\t\t%s\n", fhtod(yytext));
            break;
        case IF:
            printf("IF\t\t_\n");
            fprintf(fd, "IF\t\t_\n");
            break;
        case THEN:
            printf("THEN\t\t_\n");
            fprintf(fd, "THEN\t\t_\n");
            break;
        case ELSE:
            printf("ELSE\t\t_\n");
            fprintf(fd, "ELSE\t\t_\n");
            break;
        case WHILE:
            printf("WHILE\t\t_\n");
            fprintf(fd, "WHILE\t\t_\n");
            break;
        case DO:
            printf("DO\t\t_\n");
            fprintf(fd, "DO\t\t_\n");
            break;
    }
}

int main() {
    yyin = fopen("in.txt", "r");
    int c;
    FILE* fp = fopen("chart.txt", "w");
    while(c = yylex()){
        myprint(c, fp);
    }
    return 0;
}

int otod(char *p) {
    
}
