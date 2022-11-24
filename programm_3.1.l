%{
#include <stdio.h>
%}

%%
[+-]?[0-9]+			{
						printf("Целое число\n");
					}
[+-]?[0-9]+\.[0-9]+	{
						printf("Число с плавающей точкой\n");
					}
[a-zA-Z]+			{
						printf("Строка\n");
					}
[A-Za-z0-9]+		{
						printf("ID\n");
					}				
[ \t]+	; /* skip whitespaces */			
%%