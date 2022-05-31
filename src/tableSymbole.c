#include "tableSymbole.h"

symbole tableDesSymboles[SIZE_TABLE];
int freePointer = 0 ; //Adresse de la première case mémoire disponible pour mon programme
int profondeur = 0 ; //Profondeur de scope de notre programme
int nbSymboles = 0 ; //Nombre de symboles dans la table

symbole tableSymbolesTemporaires[SIZE_TABLE] ;
int freePointerTemp = 0 ;
int nbSymbolesTemp = 0 ;

// ---- TABLE DES SYMBOLES ---- //

//Ajoute un symbole à la table
int ts_addSymbole(char name[SIZE_NAME]){
    //On crée le symbole à partir de ses infos

    printf("Name : %s, Address : %d \n", name, freePointer);
    strncpy(tableDesSymboles[nbSymboles].name, name, SIZE_NAME);
    tableDesSymboles[nbSymboles].address = freePointer ;
    freePointer += 4;
    tableDesSymboles[nbSymboles].depth = profondeur;
    printf("NameTable : %s, AddressTable : %d \n", tableDesSymboles[nbSymboles].name, tableDesSymboles[nbSymboles].address);
    return tableDesSymboles[nbSymboles++].address;
}

//Retourne l'addresse d'un symbole dans la table à partir de son nom
int ts_getAddressSymbole(char name[SIZE_NAME]) {
    int i = 0;
    symbole currentSymbole;

    //printf("1.1\n");
    //printf("NbSymboles : %d\n", nbSymboles);
    //On parcourt la table des symboles à la recherche de celui qui nous intéresse
    while (!(strncmp(&currentSymbole.name,name, SIZE_NAME)) && (i<nbSymboles)) {
        currentSymbole = tableDesSymboles[++i] ;
    }
    
    //printf("1.2\n");

    //Si on est sorti en trouvant le nom
    if (strncmp(&currentSymbole.name,name, SIZE_NAME)) {
        //Alors je retourne l'addresse
        // printf("1.3.1\n");
        // printf("Nom cherché : %s\n", name);
        // printf("Nom trouvé : %s\n", currentSymbole.name);
        // printf("Adresse : %d", tableDesSymboles[i].address);
        return tableDesSymboles[i].address;
    }
    else {
        //Sinon je retourne -1
        //printf("1.3.2\n");
        return -1;
    }
}

//Incrément de la prodondeur du scope
void ts_profPlus(){
    printf("Plus\n");
    profondeur++ ;
}

//Décrément de la profondeur du scope
//Possibilité d'optimiser en faisant un while et en commencant à l'envers car 
//les symboles sont stockés par paquets de même profondeur
void ts_profMoins(){
    printf("Moins\n");
    for (int i = 0; i < nbSymboles; i++) {
        if (tableDesSymboles[i].depth == profondeur) {
            nbSymboles--;
            freePointer -= 4;
        }
    }
    profondeur--;
}

void ts_affiche() {
    printf("\n\nTable des symboles\n| Name | Addr | Depth |\n-----------------------\n");
    //printf("NbSymboles : %d", nbSymboles);
    for (int i = 0; i < nbSymboles; i++) {
        printf("|  %s  |  %d  |  %d  |\n", tableDesSymboles[nbSymboles].name, tableDesSymboles[nbSymboles].address, tableDesSymboles[nbSymboles].depth);
    }
    printf("\n\n");
}

int ts_addSymboleUnamed() {
    //On crée le symbole à partir de ces infos
    symbole newSymbole ;
    strcpy(newSymbole.name, "");
    newSymbole.address = freePointerTemp ;
    freePointerTemp += 4;
    newSymbole.depth = 0;
    
    //On ajoute le symbole à la table
    tableSymbolesTemporaires[nbSymbolesTemp] = newSymbole ;
    nbSymbolesTemp++;

    return &newSymbole.address ;
}

int ts_getLastTmpAddr() { //Retourne l'adresse de la dernière variable temporaire
    return freePointerTemp; //pas sure
}


void ts_freeLastTmp() {
    freePointerTemp -= 4;
    nbSymbolesTemp--;
}

void ts_afficheTmp() {
    printf("\n\nTable des symboles temporaires\n| Name | Addr | Depth |\n-----------------------\n");
    for (int i = 0; i < nbSymbolesTemp; i++) {
        printf("|  %s  |  %d  |  %d  |\n",  tableSymbolesTemporaires[nbSymbolesTemp].name, 
                                            tableSymbolesTemporaires[nbSymbolesTemp].address, 
                                            tableSymbolesTemporaires[nbSymbolesTemp].depth);
    }
    printf("\n\n");
}


// + et - 4 ça marche pas, on a pas que un int à gérer, c'est un symbole qui est la sommme de plein de trucs