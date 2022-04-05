#include "tableInstructions.h"
#include "tableSymbole.c"

int ti_insert(/*instruction*/ char instruction, int argu1, int argu2, int argu3) {
    box newBox ;
    // newBox.instruction = instruction;
    str_copy(newBox.instruction, instruction);
    newBox.destAddress = argu1;
    newBox.addr1 = argu2;
    newBox.addr2 = argu3;

    tableInstruction[nbInstructions] = newBox;

    return nbInstructions++;
}