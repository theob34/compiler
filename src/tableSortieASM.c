#include "tableSortieASM.h"



void addLigne(box box) {
    tableSortieASM[nbLignes] = box;
    nbLignes++;
}


box createBox(instruction instruction, int argu1, int argu2, int argu3){
    box newBox ;
    newBox.instruction = instruction;
    newBox.argu1 = argu1;
    newBox.argu2 = argu2;
    newBox.argu3 = argu3;
}