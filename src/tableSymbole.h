#ifndef tableSymbole
#define tableSymbole

#define SIZE_NAME 128
#define SIZE_TABLE 100

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct symbole{
    char name[SIZE_NAME] ;
    int address ;
    int depth ;
} symbole ;

// ---- TABLE DES SYMBOLES ---- //
//Ajoute un symbole à la table
int ts_addSymbole(char name[SIZE_NAME]);
//Retourne l'addresse d'un symbole dans la table à partir de son nom
int ts_getAddressSymbole(char name[SIZE_NAME]);

//Incrément de la prodondeur du scope
void ts_profPlus();
//Décrément de la profondeur du scope
void ts_profMoins();

void ts_affiche();

// ---- TABLE TEMPORAIRE ---- //
int ts_addSymboleUnamed();

int ts_getLastTmpAddr();

void ts_freeLastTmp();

void ts_afficheTmp();

#endif