%{
#include <stdio.h>
#include <string.h>
#include "programm_3.3.tab.h"
%}

%%

[0-9]+				{ yylval=atoi(yytext); return INTEGER; }
"+"					{ return ADD; }
"-"					{ return SUB; }
"*"					{ return MUL; }
"/"					{ return DIV; }
"("					{ return OBRACE; }
")"					{ return EBRACE; }
"exit"				{ return EXIT; }
\n					{return EOL;}	
[ \t]+	; /* skip whitespaces */

%%	