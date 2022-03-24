%{
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h"
%}

%option noyywrap


%%
"main"      {fprintf(stderr, " tMAIN");}
"if"        {fprintf(stderr, " tIF");}
"while"     {fprintf(stderr, " tWHILE");}
"for"       {fprintf(stderr, " tFOR");}
")"         {fprintf(stderr, " tPF");}
"("         {fprintf(stderr, " tPO");}
"{"         {fprintf(stderr, " tAO");}
"}"         {fprintf(stderr, " tAF");}
"return"    {fprintf(stderr, " tRETURN");}
";"         {fprintf(stderr, " tPV");}
"else"      {fprintf(stderr, " tELSE");}
"="         {fprintf(stderr, " tIS");}
"+"         {fprintf(stderr, " tADD");}
"*"         {fprintf(stderr, " tTIMES");}
"/"         {fprintf(stderr, " tDIV");}
"<"         {fprintf(stderr, " tINF");}
">"         {fprintf(stderr, " tSUP");}
"-"         {fprintf(stderr, " tSUB");}
"||"        {fprintf(stderr, " tOU");}
"&&"        {fprintf(stderr, " tET");}
"=="        {fprintf(stderr, " tEGAL");}
"int"       {fprintf(stderr, " tINT");}
"const"     {fprintf(stderr, " tCONST");}
"void"      {fprintf(stderr, " tVOID");}
","         {fprintf(stderr, " tCOMA");}
"printf"    {fprintf(stderr, " tPRINTF");}
"!="        {fprintf(stderr, " tDIFF");}
"++"        {fprintf(stderr, " tPLONE");}

"\n"        {fprintf(stderr, "\n");} //Juste pour l'affichage
[ \t  ]+ {} //On ne fait rien

"//.*$" {} 

-?[0-9]+  {fprintf(stderr, " tNB");}
[a-zA-Z]+(\w)* {fprintf(stderr, " tVARIABLE");}

.  {fprintf(stderr,  " tERROR");}

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