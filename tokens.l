KEYWORD auto|double|int|struct|break|else|long|switch|case|enum|register|typedef|char|extern|return|union|continue|for|signed|void|do|if|static|while|default|goto|sizeof|volatile|const|float|short|unsigned|main
ID [A-Za-z_][A-Za-z0-9_]*
OPTR [+*/%=><\-]
OPRND [-+]?[0-9]+[.]?[0-9]+
PUNCT [(){},;"'\[\]]
WS [ \t]*
%%
{KEYWORD} printf("%s - keyword\n",yytext);
{ID} printf("%s - identifier\n",yytext);
{OPTR} printf("%s - operator\n",yytext); 
{OPRND} printf("%s - constant\n",yytext); 
{PUNCT} printf("%s - punctuation character\n",yytext);
{WS} ;
\n ; 
. ;
%%
int yywrap()
{
return 1;
}
void main(argc,argv)
int argc;
char **argv;
{
if(argc>1)
{
FILE *file;
file=fopen(argv[1],"r");
if(!file)
{
printf("Could not open %s\n",argv[1]);
exit(1);
}
yyin=file;
yylex();
}
}
