#include "tableSymbole.h"
#include <stdlib.h>



// ---- TABLE DES SYMBOLES ---- //

//Ajoute un symbole à la table
int ts_addSymbole(char name[SIZE_NAME]){
    //On crée le symbole à partir de ses infos
    symbole newSymbole ;
    strcpy(newSymbole.name, name);
    newSymbole.address = freePointer ;
    freePointer += 4;
    newSymbole.depth = profondeur;
    
    //On ajoute le symbole à la table
    tableDesSymboles[nbSymboles] = newSymbole ;
    nbSymboles++;
}

//Retourne l'addresse d'un symbole dans la table à partir de son nom
int ts_getAddressSymbole(char name[SIZE_NAME]) {
    
    int i = 0;
    symbole currentSymbole;

    //On parcourt la table des symboles à la recherche de celui qui nous intéresse
    do {
        currentSymbole = tableDesSymboles[i++] ;
    } while (!(strcmp(currentSymbole.name,name)) || (i==nbSymboles)) ;

    //Si on est sorti en trouvant le nom
    if (strcmp(currentSymbole.name,name)) {
        //Alors je retourne l'addresse
        return tableDesSymboles[i].address;
    }
    else {
        //Sinon je retourne -1
        return -1;
    }
}

//Incrément de la prodondeur du scope
void ts_profPlus(){
    profondeur++ ;
}

//Décrément de la profondeur du scope
//Possibilité d'optimiser en faisant un while et en commencant à l'envers car 
//les symboles sont stockés par paquets de même profondeur
void ts_profMoins(){
    for (int i = 0; i < nbSymboles; i++) {
        if (tableDesSymboles[i].depth == profondeur) {
            nbSymboles--;
            freePointer -= 4;
        }
    }
    profondeur--;
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
}

int ts_getLastTmpAddr() { //Retourne l'adresse de la dernière variable temporaire
    return freePointerTemp; //pas sure
}


void ts_freeLastTmp() {     
    free(freePointerTemp);
    freePointerTemp -= 4;
    nbSymbolesTemp--;
}

int ts_newTmp() {           // Nul/20, je suis partie à autre chose
    nbSymbolesTemp++;
    freePointerTemp += 4;
    nbSymbolesTemp++;
       
    return freePointerTemp;
}


//+ et - 4 ça marche pas, on a pas que un int à gérer, c'est un symbole qui est la sommme de plein de trucs