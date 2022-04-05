%{
#include <stdlib.h>
#include <stdio.h>
#include "tableSymbole.h"
#include "utils.c"
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
%union { int nb; char var[128]}
%token tMAIN tIF tWHILE tFOR tPO tPF tAO tAF tRETURN tPV tELSE tIS tADD tTIMES tDIV tINF tSUP tDIFF tSUB tOU tET tEGAL tINT tCONST tVOID tCOMA tPRINTF tERROR tPLONE
%start Main
%type <nb> Expression
%token <nb> tNB
%token <var> tVARIABLE
%left '+' '-'
%left '*' '/'
%%

/* Règles */
Main : Type tMAIN tPO ArgumentOuVide tPF tAO Corps tAF { printf("J'ai reconnu le MAIN") ; } ;

ArgumentOuVide : Rien 
				| Declaration 
				| Declaration tCOMA Argument 
				;

Argument : 	Declaration 
			| Declaration tCOMA Argument 
			;

Declaration : Type Vars 
			  ;

Vars : tVARIABLE tCOMA Vars
		| tVARIABLE
		;

Corps : Bloc tRETURN Expression tPV 			
		;

Bloc : Vide 
		| Declaration tPV 
		| Initialisation 			
		| tPRINTF tPO tVARIABLE tPF tPV		{printf($3);}
		| BlocIF 
		| BlocWHILE 
		| BlocFOR 
		;

BlocIF : tIF tPO Condition tPF tAO {ts_profPlus();} Bloc tAF {ts_profMoins();} BlocELSE 
		  ; 

Condition : tVARIABLE CondOp tVARIABLE 
			| tVARIABLE CondOp tNB 
			| tNB CondOp tVARIABLE 
			| tNB CondOp tNB
			| tPO Condition tPF tOU tPO Condition tPF
			| tPO Condition tPF tET tPO Condition tPF 
			; 

CondOp : tSUP 
		 | tEGAL {ti_equal();}
		 | tINF {ti_inf();}
		 | tDIFF {ti_diff();}
		 ;

BlocELSE : Vide 
		   | tAO Bloc tAF 
		   ;

BlocWHILE : tWHILE tPO Condition tPF tAO Bloc tAF
			;

BlocFOR : tFOR tPO InitFor tPF tAO Bloc tAF 							//Pas obligé 
		  ;

InitFor : Initialisation tPV Condition tPV Incremente 	
		  ;

Initialisation : Type tVARIABLE tIS Expression tPV 		{affect($2, $4);}
			     | tVARIABLE tIS Expression tPV 		{affect($1, $3);}	
				 ;

Incremente : tVARIABLE tPLONE 							{affect($1, addplpl($1));}
			; 

Type : tINT
       | tCONST tINT 
	   ;

Rien : tVOID {}
	   | Vide {} 
	   ;

Vide : {} 
		;

Expression : Expression tADD Expression			{addArith();}
			 | Expression tSUB Expression		{subArith();}
			 | Expression tDIV Expression		{divArith();}
			 | Expression tTIMES Expression		{mulArith();}		 
		     | tVARIABLE						{ti_varArith($1);}
		     | tNB  							{ti_nbArith($1);} 
			 ;


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