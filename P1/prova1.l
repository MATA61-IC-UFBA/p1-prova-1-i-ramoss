%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
int yylex();
%}

%option noyywrap

DIGIT                       [0-9]
LETTER                      [a-zA-Z]

INTEGER                     {DIGIT}+
REAL                        {INTEGER}"."{INTEGER}

STRING                      \"[^"\n]*\"
ID                          {LETTER}[{LETTER}|{INTEGER}|_]*


%%

"//"[^\n]*                  { /* ignora comentarios de uma linha */}

"print"                     { return PRINT; }
"concat"                    { return CONCAT; }
"length"                    { return LENGTH; }


"+"                         { return PLUS; }
"-"                         { return MINUS; }
"*"                         { return TIMES; }
"/"                         { return DIV; }
"("                         { return LPAREN; }
")"                         { return RPAREN; }
"="                         { return ASSIGN; }
","                         { return COMMA; }

{STRING}                    { return STRING; }
{ID}                        { return IDENT; }
{REAL}                      { return NUM; }
{INTEGER}                   { return NUM; }

[ \t]+                      { /* ignorar espaços */ }
\n                          { return EOL; }
.                           { return ERROR; }

%%
