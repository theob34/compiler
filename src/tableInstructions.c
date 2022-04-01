#include "tableInstructions.h"
#include "tableSymbole.c"


void ti_addArith(){
    int addr = ts_getLastTmpAddr();
    int stl_addr = addr-1; //on récupère l'adrese de l'avant dernière variable temporaire
    ts_freeLastTmp();
    ti_insert("ADD", stl_addr, stl_addr, addr); 
}

void ti_mulArith() {
    int addr = ts_getLastTmpAddr();
    int stl_addr = addr-1; //on récupère l'adrese de l'avant dernière variable temporaire
    ts_freeLastTmp();
    ti_insert("MUL", stl_addr, stl_addr, addr); 
}

void ti_divArith() {
    int addr = ts_getLastTmpAddr();
    int stl_addr = addr-1; //on récupère l'adrese de l'avant dernière variable temporaire
    ts_freeLastTmp();
    ti_insert("DIV", stl_addr, stl_addr, addr); 
}

void ti_subArith() {
    int addr = ts_getLastTmpAddr();
    int stl_addr = addr-1; //on récupère l'adrese de l'avant dernière variable temporaire
    ts_freeLastTmp();
    ti_insert("SUB", stl_addr, stl_addr, addr); 
}

void ti_nbArith(int value) {
    int addr = ts_newTmp();
    ti_insert("AFC", addr, value, 0);
}

void ti_insert(char inst, int addr_dest, int addr1, int addr2 ) {

    tableInstruction[nbInstructions].inst = inst;                       //Ca marche pas mais jsp pq
    tableInstruction[nbInstructions].destAddress = addr_dest; 
    tableInstruction[nbInstructions].addr1 = addr1 ;
    tableInstruction[nbInstructions].addr2 = addr2 ; 

    nbInstructions ++;

}
void ti_varArith(char value) {
    int addr = ts_newTmp();
    ti_insert("MOV", addr, ts_getAddressSymbole(value), 0);
}

