%{
#include <stdlib.h>
#include <stdio.h>
int var[26];
void yyerror(char *s);
%}
/* Déclaration */
%union { int nb; char var; }
%token tMAIN tIF tWHILE tFOR tPO tPF tAO tAF tRETURN tPV tELSE tIS tADD tTIMES tDIV tINF tSUP tDIFF tSUB tOU tET tEGAL tINT tCONST tVOID tNEWLINE tSPACE tTAB tCOMA tPRINTF tCHIFFRE tMOT tVARIABLE tERROR tPLONE
%token <nb> tNB
%token <var> tID
%type <nb> Expr DivMul Terme
%start Main
%%
/* Règles */
Main : Type tMAIN tPO ArgumentOuVide tPF tAO Corps tAF {printf("J'ai reconnu le MAIN") ; } ;
ArgumentOuVide : Rien 
				| Declaration 
				| Declaration tCOMA Argument ;

Argument : 	Declaration 
			| Declaration tCOMA Argument ;

Declaration : Type tVARIABLE ;

Corps : Bloc tRETURN Expression tPV ;

Bloc : Vide 
		| Declaration tPV 
		| Declaration tIS Expression tPV 
		| tVARIABLE tIS Expression tPV 
		| Print tPV 
		| BlocIF 
		| BlocWHILE 
		| BlocFOR;

Print : tPRINTF tPO tVARIABLE tPF ;

BlocIF : tIF tPO Condition tPF tAO Bloc tAF BlocELSE 
		| tIF Condition tAO Bloc tAF BlocELSE ; 

Condition : tVARIABLE CondOp tVARIABLE 
			| tVARIABLE CondOp tCHIFFRE 
			| tCHIFFRE CondOp tVARIABLE 
			| tCHIFFRE CondOp tCHIFFRE ; 

CondOp : tSUP 
		| tEGAL 
		| tINF 
		| tDIFF;

BlocELSE : Vide 
		   | tAO Bloc tAF ;

BlocWHILE : tWHILE tPO Condition tPF tAO Bloc tAF 
			| tWHILE tPO Condition tPF tAO Bloc tAF ;

BlocFOR : tFOR tPO For tPF tAO Bloc tAF ;

For : Decla Condition tPV Incremente ;

Incremente : tVARIABLE tPLONE 
			| tVARIABLE tIS tVARIABLE tADD tCHIFFRE 
			| tVARIABLE tIS tVARIABLE tADD tVARIABLE ; 

Decla : Declaration tIS tCHIFFRE tPV 
		| tVARIABLE tIS tCHIFFRE tPV ;

Type : tINT ;

Rien : tVOID 
		| Vide ;

Vide : ;

Expression : tVARIABLE 
			| tCHIFFRE ;






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