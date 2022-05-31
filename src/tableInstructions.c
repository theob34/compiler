#include "tableInstructions.h"

box tableInstruction[SIZE_TABLE] ;

int freePtr = 0 ; //Adresse de la première case mémoire disponible pour mon programme
int nbInstructions = 0 ; //Nombre d'instructions dans la table


int ti_insert(char * instruction, int argu1, int argu2, int argu3) {
    box * newBox ;
    newBox = malloc(sizeof(box));
    memset(newBox, 0, sizeof(char*) + 3 * sizeof(int));
    //printf("Init OK\n");
    strncpy(&(newBox->instruction), instruction, 3);
    newBox->destAddress = argu1;
    newBox->addr1 = argu2;
    newBox->addr2 = argu3;
    //printf("Créa OK\n");
    //printf("Nom : %s \n", newBox->instruction);
    tableInstruction[nbInstructions] = *newBox;
    //printf("%s\n", tableInstruction[nbInstructions].instruction);

    return nbInstructions++;
}

void ti_modif(int line, char * instruction, int argu1, int argu2, int argu3) {
    if (instruction != NULL) {
        strcpy(tableInstruction[line].instruction, instruction);
    }
    if (argu1 != NULL) {
        tableInstruction[line].destAddress = argu1;
    }
    if (argu2 != NULL) {
        tableInstruction[line].addr1 = argu2 ;
    }
    if (argu3 != NULL) {
        tableInstruction[line].addr2 =  argu3;
    }
    ti_affiche();
}

int ti_nbInstructions() {
    return nbInstructions;
}

void ti_affiche() {
    printf("\n\nTable des instructions\n| Instr | Dest | Addr1 | Addr2 |\n--------------------------------\n");
    for (int i = 0; i < nbInstructions; i++) {
        printf("| %s |  %d  |  %d  |  %d  |\n",   tableInstruction[nbInstructions].instruction, 
                                                    tableInstruction[nbInstructions].destAddress, 
                                                    tableInstruction[nbInstructions].addr1, 
                                                    tableInstruction[nbInstructions].addr2 );
    }
    printf("\n\n");
}