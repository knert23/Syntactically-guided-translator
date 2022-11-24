# Syntactically-guided-translator
Developing a syntactically guided translator using lex and yacc
To run the programm on Linux:
bison -d <programm_name>.y
flex <programm_name>.l
cc lex.yy.c <programm_name>.tab.c -o <programm_name>
./<programm_name>
