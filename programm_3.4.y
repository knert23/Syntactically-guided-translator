%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "programm_3.4.tab.h"

int yylex(void);

void yyerror(const char *str){
        fprintf(stderr,"ошибка: %s\n",str);
}

int yywrap(){
        return 1;
} 

int main(){
        yyparse();
}

%}

%union {         
        double dval;
        int ival;
}

%token FNUMB
%token ADD SUB MUL DIV
%token OBRACE EBRACE
%token EXIT
%token EOL

%type <dval> FNUMB
%type <dval> exp
%type <dval> term
%type <dval> factor

%%

commands: /* nothing */
| commands command
;

command: exp
| EOL { printf("\n"); } 
| EXIT { printf("bye!\n"); exit(0); }
;

exp: factor
| exp ADD factor { printf("+"); }
| exp SUB factor { printf("-"); }
;

factor: term
| factor MUL term { printf("*"); }
| factor DIV term { printf("/"); }
;

term: FNUMB { printf("%f ", $1); }
| OBRACE exp EBRACE { $$ = $2; }
;

%%