%{
#include <stdlib.h>
#include <stdio.h>
#include "tableSymbole.h"
int var[26];
void yyerror(char *s);
%}
// -------------- A FAIRE -------------------- //
/*
-> Rajouter les priorités des parenthèses pour les calculs mathématiques
-> Gérer tERROR

*/



/* Déclaration */
/*
tPO -> Parenthèse Ouvrante
tPF -> Parenthèse Fermante
tAO -> Accolade Ouvrante
tAF -> Accolade Fermante
tPV -> Point Virgule
tPLONE -> Plus One (++)
tIS -> =
tEGAL -> ==
*/
%union { int nb; }
%token tMAIN tIF tWHILE tFOR tPO tPF tAO tAF tRETURN tPV tELSE tIS tADD tTIMES tDIV tINF tSUP tDIFF tSUB tOU tET tEGAL tINT tCONST tVOID tCOMA tPRINTF tVARIABLE tERROR tPLONE tNB
%start Main
%left '+' '-'
%left '*' '/'
%%

/* Règles */
Main : Type tMAIN tPO ArgumentOuVide tPF tAO Corps tAF { printf("J'ai reconnu le MAIN") ; } ;

ArgumentOuVide : Rien 
				| Declaration 
				| Declaration tCOMA Argument ;

Argument : 	Declaration 
			| Declaration tCOMA Argument ;

Declaration : Type Vars ;

Vars : tVARIABLE tCOMA Vars
		| tVARIABLE

Corps : Bloc tRETURN Expression tPV ;

Bloc : Vide 
		| Declaration tPV 
		| Type tVARIABLE tIS Expression tPV 
		| tVARIABLE tIS Expression tPV 
		| Print tPV 
		| BlocIF 
		| BlocWHILE 
		| BlocFOR ;

Print : tPRINTF tPO tVARIABLE tPF ;

BlocIF : tIF tPO Condition tPF tAO Bloc tAF BlocELSE ; 

Condition : tVARIABLE CondOp tVARIABLE 
			| tVARIABLE CondOp tNB 
			| tNB CondOp tVARIABLE 
			| tNB CondOp tNB
			| tPO Condition tPF tOU tPO Condition tPF
			| tPO Condition tPF tET tPO Condition tPF ; 

CondOp : tSUP 
		 | tEGAL 
		 | tINF 
		 | tDIFF;

BlocELSE : Vide 
		   | tAO Bloc tAF ;

BlocWHILE : tWHILE tPO Condition tPF tAO Bloc tAF;

BlocFOR : tFOR tPO InitFor tPF tAO Bloc tAF ;

InitFor : Initialisation tPV Condition tPV Incremente ;

Initialisation : Type tVARIABLE tIS Expression tPV 
			     | tVARIABLE tIS Expression tPV ;

Incremente : tVARIABLE tPLONE 
			| tVARIABLE tIS tVARIABLE tADD tNB 
			| tVARIABLE tIS tVARIABLE tADD tVARIABLE ; 

Type : tINT
       | tCONST tINT ;

Rien : tVOID 
	   | Vide ;

Vide : ;

Expression : tVARIABLE 
			| tNB 
			| Calcul ;

Calcul : Calcul Op tVARIABLE 
	     | Calcul Op tNB 
		 | tVARIABLE
		 | tNB ;

Op : tADD
	| tSUB
	| tDIV
	| tTIMES ;

%%


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