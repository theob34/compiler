#include "tableInstructions.h"
#include "tableSymbole.c"
#include <string.h>

int ti_insert( char instruction, int argu1, int argu2, int argu3) {
    box newBox ;
    // newBox.instruction = instruction;
    strcpy(newBox.instruction, instruction);
    newBox.destAddress = argu1;
    newBox.addr1 = argu2;
    newBox.addr2 = argu3;

    tableInstruction[nbInstructions] = newBox;

    return nbInstructions++;
}

