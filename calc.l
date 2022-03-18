%{
include <stdlib.h>
include <stdio.h>
include "y.tab.h"
%}

%option noyywrap


%%
"main" {fprintf (stderr, "MAIN")}
"if" {fprintf (stderr, "IF");}
"while" {fprintf (stderr, "WHILE");}
"for" {fprintf (stderr, "FOR");}
")" {fprintf (stderr, ")");}
"(" {fprintf (stderr, "(");}
"{" {fprintf (stderr, "{");}
"}" {fprintf (stderr, "}");}
"return" {fprintf (stderr, "RETURN");}
";" {fprintf (stderr, ";");}
"else" {fprintf (stderr, "ELSE");}
"=" {fprintf (stderr, "=");}
"+" {fprintf (stderr, "ADD");}
"*" {fprintf (stderr, "TIMES");}
"/" {fprintf (stderr, "DIV");}
"<" {fprintf (stderr, "<");}
">" {fprintf (stderr, ">");}
"-" {fprintf (stderr, "SUB");}
"||" {fprintf (stderr, "||");}
"&&" {fprintf (stderr, "&&");}
"==" {fprintf (stderr, "==");}
"int" {fprintf (stderr, "INT");}
"const" {fprintf (stderr, "CONST");}
"void" {fprintf (stderr, "VOID");}
"\n" {fprintf (stderr, "NEXWLINE");}
" " {fprintf (stderr, "SPACE");}
"   " {fprintf (stderr, "TAB");}
"," {fprintf (stderr, "COMA");}
"printf" {fprintf (stderr, "PRINTF");}

"!=" {fprintf (stderr, "DIFF");}
"++" {fprintf (stderr, "PLONE");}


"//.*$" {} //On ne fait rien

-?[0-9]+  {fprintf (stderr, "CHIFFRE");}
[a-z]+  {fprintf (stderr, "MOT");}
[a-zA-Z]+\w {fprintf (stderr, "VARIABLE");}

.  {error}

%%

// Facultatif
// "<=" {fprintf (stderr, "<=");}
// ">=" {fprintf (stderr, ">=");}
// "^=" {fprintf (stderr, "^=");}
// "&" {fprintf (stderr, "&");}
// "|" {fprintf (stderr, "|");}
// "<<" {fprintf (stderr, "<<");}
// "goto" {fprintf (stderr, "GOTO");}
// ":" {fprintf (stderr, ":");}
// "%" {fprintf (stderr, "%");}
// "volatile" {fprintf (stderr, "VOLATILE");}
// "struct" {fprintf (stderr, "STRUCT");}
// "enum" {fprintf (stderr, "ENUM");}