#include "utils.h"
#include <stdio.h>

//ON A DU MAL A SAISIR : 
//Comment on récupère la valeur depuis l'adresse ?


// ---- FONCTIONS POUR LES OPERATIONS ---- //
int addArith(int addr1, int addr2){
    int addr_dest = ts_addSymboleUnamed();
    ti_insert("ADD", addr_dest, addr1, addr2); 
    return addr_dest;
}

int mulArith(int addr1, int addr2) {
    int addr_dest = ts_addSymboleUnamed();
    ti_insert("MUL", addr_dest, addr1, addr2); 
    return addr_dest;
}

int divArith(int addr1, int addr2) {
    int addr_dest = ts_addSymboleUnamed();
    ti_insert("DIV", addr_dest, addr1, addr2); 
    return addr_dest;
}

int subArith(int addr1, int addr2) {
    int addr_dest = ts_addSymboleUnamed();
    ti_insert("SOU", addr_dest, addr1, addr2); 
    return addr_dest;
}

int nbArith(int value) {
    //printf("1\n");
    int addr = ts_addSymboleUnamed();
    //printf("2\n");
    ti_insert("AFC", addr, value, NULL);
    //printf("3\n");
    return addr;
}

int addplpl(int addr) {
    int addrOne = ts_addSymboleUnamed();
    ti_insert("AFC", addrOne, 1, NULL);
    ti_insert("ADD", addr, addr, addrOne);
    return addr;
}

int affect(char * var, int addr_value) {
    //printf("1\n");
    int addr_var = ts_getAddressSymbole(var);
    //printf("2\n");
    ti_insert("COP", addr_var, addr_value, NULL);
    //printf("3\n");
    return addr_var;
}




int cond(int addr1, int addr2, int op) {
    int addrResult = ts_addSymboleUnamed();
    switch(op){ 
        case 1 /*SUP*/:     ti_insert("SUP", addrResult, addr1, addr2);  
                            break ;
        
        case 2 /*EGAL*/:    ti_insert("EQU", addrResult, addr1, addr2);
                            break ; 
        case 3 /*INF*/:     ti_insert("INF", addrResult, addr1, addr2);
                            break ; 
        case 4 /*DIFF*/:    //ti_insert("EQU", addrResult, addr1, addr2);
                            //ti_insert("COP", addrResult, not(addrResult), NULL); 
                            //AMELIORER : Comment on fait le != ?
                            break ; 
        default : ti_insert("AFC", addrResult, addr1, addr2);
                        
    }
    return addrResult;
}

int preIf(int addrCond) {
    int line = ti_insert("JMF", addrCond, NULL, NULL);
    return line;
}

void postIf(int line) {
    ti_modif(line, NULL, NULL, ti_nbInstructions(), NULL);
}

int preWhile(int addrCond){
    int line = ti_insert("JMF", addrCond, NULL, NULL);
    return line;
}

void postWhile(int line){
    ti_modif(line, NULL, NULL, ti_nbInstructions(), NULL);
}

int preElse() {
    int line = ti_insert("JMP", NULL, NULL, NULL);
    return line;
}

void postElse(int line) {
    ti_modif(line, NULL, ti_nbInstructions(), NULL, NULL);
}


