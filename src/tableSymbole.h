#define SIZE_NAME 128
#define SIZE_TABLE 100

typedef struct symbole{
    char name[SIZE_NAME] ;
    int address ;
    int depth ;
} symbole ;

symbole tableDesSymboles[SIZE_TABLE] ;
int freePointer = 0 ; //Adresse de la première case mémoire disponible pour mon programme
int profondeur = 0 ; //Profondeur de scope de notre programme
int nbSymboles = 0 ;

//Ajoute un symbole à la table
int addSymbole(char name[SIZE_NAME]);
//Retourne l'addresse d'un symbole dans la table à partir de son nom
int getAddressSymbole(char name[SIZE_NAME]);

//Incrément de la prodondeur du scope
void profPlus();
//Décrément de la profondeur du scope
void profMoins();

//addSymboleUnamed();