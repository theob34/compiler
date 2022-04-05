#include "utils.h"

// ---- FONCTIONS POUR LES OPERATIONS ---- //
void addArith(){
    int addr = ts_getLastTmpAddr();
    int stl_addr = addr-1; //on récupère l'adresse de l'avant dernière variable temporaire
    ts_freeLastTmp();
    ti_insert("ADD", stl_addr, stl_addr, addr); 
}

void mulArith() {
    int addr = ts_getLastTmpAddr();
    int stl_addr = addr-1; //on récupère l'adresse de l'avant dernière variable temporaire
    ts_freeLastTmp();
    ti_insert("MUL", stl_addr, stl_addr, addr); 
}

void divArith() {
    int addr = ts_getLastTmpAddr();
    int stl_addr = addr-1; //on récupère l'adresse de l'avant dernière variable temporaire
    ts_freeLastTmp();
    ti_insert("DIV", stl_addr, stl_addr, addr); 
}

void subArith() {
    int addr = ts_getLastTmpAddr();
    int stl_addr = addr-1; //on récupère l'adresse de l'avant dernière variable temporaire
    ts_freeLastTmp();
    ti_insert("SUB", stl_addr, stl_addr, addr); 
}
void nbArith(int value) {
    int addr = ts_addSymboleUnamed();
    ti_insert("AFC", addr, value, 0);
}

void addplpl() {
    int addressOne = addSymboleUnamed();
    ti_insert("AFC", addressOne, 1, 0);
}

void varArith(char value) {
    int addr = ts_addSymboleUnamed();
    ti_insert("MOV", addr, ts_getAddressSymbole(value), 0);
}


