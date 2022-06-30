%{
#include <stdio.h>
#include <string.h>
#include <math.h>
#define YYSTYPE char*

#include "y.tab.h"
%}

%%
([ ]+) {}

(\/\*(.|\n)*\*\/) {}

(if) {fprintf(yyout,"Control Statement: IF_Statement\n");return IF;}

(else) {fprintf(yyout,"Control Statement: ELSE_Statement\n");return ELSE;}

(while) {fprintf(yyout,"Control Statement: WHILE_Statement\n");return WHILE;}

([\{]) {fprintf(yyout,"Parenthesis : LEFT_CURLY_BRACKET\n");return yytext[0];}

([\}]) {fprintf(yyout,"Parenthesis : RIGHT_CURLY_BRACKET\n");return yytext[0];}

([\(]) {fprintf(yyout,"Parenthesis : LEFT_ANGULAR_BRACKET\n");return yytext[0];}

([\)]) {fprintf(yyout,"Parenthesis : RIGHT_ANGULAR_BRACKET\n");return yytext[0];}

([\[]) {fprintf(yyout,"Parenthesis : LEFT_SQUARE_BRACKET\n");return yytext[0];}

([\]]) {fprintf(yyout,"Parenthesis : RIGHT_SQUARE_BRACKET\n");return yytext[0];}

(char[ \t\n]*[\*]*) { yylval=strdup(yytext); fprintf(yyout,"TYPE: %s\n",yytext);return DATATYPE;}

(int) { yylval=strdup(yytext); fprintf(yyout,"TYPE: %s\n",yytext);return DATATYPE;}

(return) { yylval=strdup(yytext); fprintf(yyout,"TYPE: %s\n",yytext);return RET;}

([A-Za-z][A-Za-z0-9_]*) { yylval=strdup(yytext); fprintf(yyout,"ID: %s\n",yytext);return ID;}

(;) { yylval=strdup(yytext); fprintf(yyout,"SEMI : ;\n");return yytext[0];}

([0-9]*) { yylval=strdup(yytext); fprintf(yyout,"NUM : %s\n",yytext);return NUM;}

([<>=!]=|>|<) { yylval=strdup(yytext); fprintf(yyout,"RELATIONAL OPERATOR: %s\n",yytext);yylval=malloc(strlen(yytext));strcpy(yylval,yytext);return RO;}

([\%]) { yylval=strdup(yytext); fprintf(yyout,"MODULO : %%\n");return yytext[0];}

([\*]) { yylval=strdup(yytext); fprintf(yyout,"PRODUCT : *\n");return yytext[0];}

([\/]) { yylval=strdup(yytext); fprintf(yyout,"DIVIDE : /\n");return yytext[0];}

([\+]) { yylval=strdup(yytext); fprintf(yyout,"PLUS : +\n");return yytext[0];}

([\-]) { yylval=strdup(yytext); fprintf(yyout,"SUBTRACT : -\n");return yytext[0];}

([=]) { yylval=strdup(yytext); fprintf(yyout,"ASSIGN : =\n");return yytext[0];}

([,]*) { yylval=strdup(yytext); fprintf(yyout,"COMMA : ,\n");return yytext[0];}

%%

