#ifndef tableInstructions
#define tableInstructions

#include "tableSymbole.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#define SIZE_TABLE 100


typedef struct box {
    char * instruction;
    int destAddress;
    int addr1;
    int addr2;
} box ;

int ti_insert(char * instruction, int argu1, int argu2, int argu3) ;
void ti_modif(int line, char * instruction, int argu1, int argu2, int argu3) ;
int ti_nbInstructions() ;
void ti_affiche();

#endif
