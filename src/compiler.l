%{
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h"
%}

%option noyywrap


%%
"main"      {return tMAIN;}
"if"        {return tIF;}
"while"     {return tWHILE;}
"for"       {return tFOR;}
")"         {return tPF;}
"("         {return tPO;}
"{"         {return tAO;}
"}"         {return tAF;}
"return"    {return tRETURN;}
";"         {return tPV;}
"else"      {return tELSE;}
"="         {return tIS;}
"+"         {return tADD;}
"*"         {return tTIMES;}
"/"         {return tDIV;}
"<"         {return tINF;}
">"         {return tSUP;}
"-"         {return tSUB;}
"||"        {return tOU;}
"&&"        {return tET;}
"=="        {return tEGAL;}
"int"       {return tINT;}
"const"     {return tCONST;}
"void"      {return tVOID;}
","         {return tCOMA;}
"printf"    {return tPRINTF;}
"!="        {return tDIFF;}
"++"        {return tPLONE;}

[ \t\n  ]+ {} //On ne fait rien


"//.*$" {} 
-?[0-9]+  {return tNB;}
[a-zA-Z]+(\w)* {return tVARIABLE;}

.  {return tERROR;}

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