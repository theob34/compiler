#include "tableSymbole.h"
#define SIZE_TABLEAU 10000

#ifndef tableSortie
#define tableSortie

enum instruction {ADD, MUL, SOU, DIV, COP, AFC, JMP, JMF, INF, SUP, EQU, PRI} typedef instruction;

typedef struct box {
    instruction instruction;
    int argu1;
    int argu2;
    int argu3;
} box ;

int nbLignes = 0;

box tableSortieASM[SIZE_TABLEAU] ;

void addLigne(box box);
box createBox(instruction instruction, int argu1, int argu2, int argu3);

#endif