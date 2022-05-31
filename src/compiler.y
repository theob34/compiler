%{
#include <stdlib.h>
#include <stdio.h>
#include "utils.h"
int var[26];
void yyerror(char *s);
%}
// -------------- A FAIRE -------------------- //
/*
-> Rajouter les priorités des parenthèses pour les calculs mathématiques
-> Gérer tERROR
-> Rajouter la possibilité de faire des elsif et des elses imbriqués
-> Créer une fonction d'affichage de la table des symboles et de la table des Instructions et l'affiche lorsque l'on reconnait le MAIN pour regarder si tout s'ajoute bien
-> On a des problèmes de merde avec l'Affectation d'une variable lorsque l'on veut l'affecter ensuite, Cordialement, les mecs qui ont en marre
*/



/* Déclaration */
/*
tPO -> Parenthèse Ouvrante
tPF -> Parenthèse Fermante
tAO -> Accolade Ouvrante
tAF -> Accolade Fermante
tPV -> Point Virgule
tIS -> =
tEGAL -> ==
*/
%union { int nb; char var[128]}
%token tMAIN tIF tWHILE tPO tPF tAO tAF tRETURN tPV tELSE tIS tTIMES tDIV tADD tINF tSUP tDIFF tSUB tOU tET tEGAL tINT tCONST tVOID tCOMA tPRINTF tERROR
%start Main
%type <nb> Expression
%type <nb> CondOp
%type <nb> Declaration Condition Affectation
%token <nb> tNB
%token <var> tVARIABLE
%left '+' '-'
%left '*' '/'
%%

/* Règles */
Main : Type tMAIN tPO ArgumentOuVide tPF tAO {printf("Je détecte le début du MAIN\n");} Corps tAF { ti_affiche(); ts_affiche(); ts_afficheTmp(); printf("J'ai reconnu le MAIN\n") ; } ;

ArgumentOuVide : Rien 
				| Declaration 
				| Declaration tCOMA Argument 
				;

Argument : 	Declaration 
			| Declaration tCOMA Argument 
			;

Declaration : {printf("Décla + Init \n");} Type tVARIABLE {ts_addSymbole($3);} tIS Expression {$$ = affect($3, $6);}
			  | {printf("Décla \n");} Type tVARIABLE {$$ = ts_addSymbole($3);}
			  ;

Corps : {printf("Corps\n");} Bloc tRETURN Expression {printf("Return\n");} tPV 			
		;

Bloc : Vide 
		| Affectation Bloc			
		| Declaration tPV Bloc
		| tPRINTF tPO tVARIABLE tPF tPV	Bloc	{printf($3);}
		| BlocIF Bloc
		| BlocWHILE Bloc
		;

BlocIF : tIF tPO Condition tPF tAO {printf("IF\n"); ts_profPlus(); $<nb>$ = preIf($3);} Bloc tAF {$<nb>$ = preElse(); postIf($<nb>6); ts_profMoins();} BlocELSE {postElse($<nb>9);} 
		; 

Condition : Expression CondOp Expression {$$ = cond($1, $3, $2);} 
			/*| tPO Condition tPF tOU tPO Condition tPF 
			| tPO Condition tPF tET tPO Condition tPF */
			/* AMELIORER : Comment on fait les OR et les AND ? Surtout est ce qu'on les fait ? */
			; 

CondOp : tSUP 		{$$ = 1;}
		 | tEGAL 	{$$ = 2;}
		 | tINF 	{$$ = 3;}
		 | tDIFF 	{$$ = 4;}
		 ;

BlocELSE : Vide
		   | tELSE {ts_profPlus(); printf("Else\n");} tAO Bloc {ts_profMoins();} tAF 
		   ;

BlocWHILE : tWHILE tPO Condition tPF tAO {printf("Bloc While \n"); ts_profPlus(); $<nb>$ = preWhile($3);} Bloc {postWhile($<nb>6); ts_profMoins(); } tAF
			;


Affectation : 	{printf("Affectation\n");} tVARIABLE tIS Expression tPV {$$ = affect($2, $4);}
				; 

Type : tINT
       | tCONST tINT 
	   ;

Rien : tVOID {}
	   | Vide {} 
	   ;

Vide : {} 
		;

Expression : Expression tADD Expression			{printf("Add \n"); $$ = addArith($1, $3);}
			 | Expression tSUB Expression		{printf("Sub\n"); $$ = subArith($1, $3);}
			 | Expression tDIV Expression		{printf("Div\n"); $$ = divArith($1, $3);}
			 | Expression tTIMES Expression		{printf("Times\n"); $$ = mulArith($1, $3);}		 
		     | tVARIABLE						{$$ = ts_getAddressSymbole($1);}
		     | tNB  							{$$ = nbArith($1);} 
			 ;


%%