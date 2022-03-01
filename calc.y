%{
#include <stdlib.h>
#include <stdio.h>
int var[26];
void yyerror(char *s);
%}
/* Déclaration */
%union { int nb; char var; }
%token tMAIN tIF tWHILE tFOR tPO tPF tAO tAF tRETURN tPV tELSE tIS tADD tTIMES tDIV tINF tSUP tSUB tOU tET tEGAL tINT tCONST tVOID tNEWLINE tSPACE tTAB tCOMA tPRINTF tCHIFFRE tMOT tVARIABLE tERROR
%token <nb> tNB
%token <var> tID
%type <nb> Expr DivMul Terme
%start Main
%%
/* Règles */
Main : tINT tMAIN tPO ArgumentOuVide tPF tAO Corps tAF {printf("J'ai reconnu le MAIN") ; } ;
ArgumentOuVide : Rien | Declaration | Declaration tCOMA Argument ;
Argument : Declaration | Declaration tCOMA Argument ;
Declaration : Type tVARIABLE ;
Corps : Bloc tRETURN Expression tPV ;
Bloc : Vide | Declaration tPV | Declaration tIS Expression tPV | tVARIABLE tIS Expression tPV | tPRINTF tPV | BlocIF | BlocWHILE ;
Type : tINT ;
Rien : tVOID | Vide ;
Vide : ;

%%
/* Programmes */
void yyerror(char *s) { fprintf(stderr, "%s\n", s); }
int main(void) {
  printf("Calculatrice\n"); // yydebug=1;
  yyparse();
  return 0;
}

/* 
Calculatrice :	  Calcul Calculatrice | Calcul ;
Calcul :	  Expr tFL { printf("> %d\n", $1); }
		| tID tEGAL Expr tFL { var[(int)$1] = $3; } ;
Expr :		  Expr tADD DivMul { $$ = $1 + $3; }
		| Expr tSOU DivMul { $$ = $1 - $3; }
		| DivMul { $$ = $1; } ;
DivMul :	  DivMul tMUL Terme { $$ = $1 * $3; }
		| DivMul tDIV Terme { $$ = $1 / $3; }
		| Terme { $$ = $1; } ;
Terme :		  tPO Expr tPF { $$ = $2; }
		| tID { $$ = var[$1]; }
		| tNB { $$ = $1; } ;
		
 */