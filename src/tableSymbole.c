#include "tableSymbole.h"

//Ajoute un symbole à la table
int addSymbole(char name[SIZE_NAME]){
    //On crée le symbole à partir de ces infos
    symbole newSymbole ;
    strcpy(newSymbole.name, name);
    newSymbole.address = freePointer ;
    freePointer = freePointer + 4;
    newSymbole.depth = profondeur;
    
    //On ajoute le symbole à la table
    tableDesSymboles[nbSymboles] = newSymbole ;
    nbSymboles++;
}

//Retourne l'addresse d'un symbole dans la table à partir de son nom
int getAddressSymbole(char name[SIZE_NAME]) {
    
    int i = 0;
    symbole currentSymbole;

    //On parcourt la table des symboles à la recherche de celui qui nous intéresse
    do {
        currentSymbole = tableDesSymboles[i++] ;
    } while ((currentSymbole.name != name) || (i==nbSymboles)) ;

    //Si on est sorti en trouvant le nom
    if (currentSymbole.name == name) {
        //Alors je retourne l'addresse
        return tableDesSymboles[i].address;
    }
    else {
        //Sinon je retourne -1
        return -1;
    }
}

//Incrément de la prodondeur du scope
void profPlus(){
    profondeur++ ;
}

//Décrément de la profondeur du scope
//Possibilité d'optimiser en faisant un while et en commencant à l'envers car 
//les symboles sont stockés par paquets de même profondeur
void profMoins(){
    for (int i = 0; i < nbSymboles; i++) {
        if (tableDesSymboles[i].depth == profondeur) {
            nbSymboles--;
            freePointer -= 4;
        }
    }
    profondeur--;
}
