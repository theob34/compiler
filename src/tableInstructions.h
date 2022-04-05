#include "tableSymbole.h"
#define SIZE_TABLE 100
#ifndef tableInstructions
#define tableInstructions

// typedef enum instruction {ADD, MUL, SOU, DIV, COP, AFC, JMP, JMF, INF, SUP, EQU, PRI} instruction;

typedef struct box {
    // instruction instruction;
    char instruction;
    int destAddress;
    int addr1;
    int addr2;
} box ;

box tableInstruction[SIZE_TABLE] ;

int freePtr = 0 ; //Adresse de la première case mémoire disponible pour mon programme
int nbInstructions = 0 ; //Nombre d'instructions dans la table

int ti_insert(/*instruction*/ char instruction, int argu1, int argu2, int argu3) ;

#endif
