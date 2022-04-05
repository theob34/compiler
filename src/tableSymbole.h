#define SIZE_NAME 128
#define SIZE_TABLE 100
#ifndef tableSymbole
#define tableSymbole

typedef struct symbole{
    char name[SIZE_NAME] ;
    int address ;
    int depth ;
} symbole ;

symbole tableDesSymboles[SIZE_TABLE] ;
int freePointer = 0 ; //Adresse de la première case mémoire disponible pour mon programme
int profondeur = 0 ; //Profondeur de scope de notre programme
int nbSymboles = 0 ; //Nombre de symboles dans la table

symbole tableSymbolesTemporaires[SIZE_TABLE] ;
int freePointerTemp = 0 ;
int nbSymbolesTemp = 0 ;

// ---- TABLE DES SYMBOLES ---- //
//Ajoute un symbole à la table
int ts_addSymbole(char name[SIZE_NAME]);
//Retourne l'addresse d'un symbole dans la table à partir de son nom
int ts_getAddressSymbole(char name[SIZE_NAME]);

//Incrément de la prodondeur du scope
void ts_profPlus();
//Décrément de la profondeur du scope
void ts_profMoins();

// ---- TABLE TEMPORAIRE ---- //
int ts_addSymboleUnamed();

int ts_getLastTmpAddr();

void ts_freeLastTmp();

#endif