%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *msg);

%}

%token PRINT
%token CONCAT
%token LENGTH

%token PLUS
%token MINUS
%token TIMES
%token DIV
%token LPAREN
%token RPAREN
%token ASSIGN
%token COMMA

%token STRING
%token IDENT
%token NUM

%token EOL 0
%token ERROR

%start program

%%

/* programa */
program
: stmt_list 
;

stmt_list
: stmt
| stmt_list stmt
;

stmt
: IDENT ASSIGN expr
| PRINT LPAREN exprlist RPAREN
| expr
;

exprlist
    : exprlist ',' expr
    | expr
;

expr
    : expr PLUS term
    | expr MINUS term
    | term
;

term
    : term TIMES factor
    | term DIV factor
    | factor
;

factor
    : LPAREN expr RPAREN
    | NUM
    | IDENT
    | STRING
;
%%

