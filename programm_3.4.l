%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "programm_3.4.tab.h"
%}

%%

[0-9]+[\.]?[0-9]*	{ yylval.dval = atof(yytext); return FNUMB; }
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