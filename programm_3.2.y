%{
#include <stdio.h>
#include <string.h>
#include "programm_3.2.tab.h"

int yylex(void);

void yyerror(const char *str){
        fprintf(stderr,"ошибка: %s\n",str);
}

int yywrap(){
        return 1;
} 

int main(int argc, char **argv){
        yyparse();
}

%}

%token INTEGER 
%token ADD SUB MUL DIV
%token OBRACE EBRACE
%token EOL

%%

calclist: /* nothing */
| calclist exp EOL { printf("= %d\n", $2); }
;

exp: factor
| exp ADD factor { $$ = $1 + $3; }
| exp SUB factor { $$ = $1 - $3; }
;

factor: term
| factor MUL term { $$ = $1 * $3; }
| factor DIV term { $$ = $1 / $3; }
;
term: INTEGER
| OBRACE exp EBRACE { $$ = $2; }
;

%%