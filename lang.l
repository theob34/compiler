% {
include <stdlib.h>
include <stdio.h>
include "y.tab.h"

%}

%%
"if" {fprintf (stderr, "tIF");}
"while" {fprintf (stderr, "tWHILE");}
"for" {fprintf (stderr, "tFOR");}
")" {fprintf (stderr, ")");}
"(" {fprintf (stderr, "(");}
"{" {fprintf (stderr, "{");}
"}" {fprintf (stderr, "}");}
"return" {fprintf (stderr, "tRETURN");}
";" {fprintf (stderr, ";");}
"else" {fprintf (stderr, "tELSE");}
"=" {fprintf (stderr, "=");}
"+" {fprintf (stderr, "tADD");}
"*" {fprintf (stderr, "tMUL");}
"<" {fprintf (stderr, "<");}
">" {fprintf (stderr, ">");}
"-" {fprintf (stderr, "tSOU");}
"||" {fprintf (stderr, "||");}
"&&" {fprintf (stderr, "&&");}
"==" {fprintf (stderr, "==");}
"int" {fprintf (stderr, "tINT");}
"const" {fprintf (stderr, "tCONST");}
"void" {fprintf (stderr, "tVOID");}

"<=" {fprintf (stderr, "<=");}
">=" {fprintf (stderr, ">=");}
"^=" {fprintf (stderr, "^=");}
"&" {fprintf (stderr, "&");}
"|" {fprintf (stderr, "|");}
"<<" {fprintf (stderr, "<<");}
"goto" {fprintf (stderr, "tGOTO");}
":" {fprintf (stderr, ":");}
"%" {fprintf (stderr, "%");}
"volatile" {fprintf (stderr, "tVOLATILE");}
"struct" {fprintf (stderr, "tSTRUCT");}
"enum" {fprintf (stderr, "tENUM");}


"//.*$" {.} //On ne fait rien

-?[0-9]+  {fprintf (stderr, "chiffre");}
[a-z]+  {fprintf (stderr, "mot");}

.  {error}

%%
