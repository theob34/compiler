#include "tableSymbole.h"
#include "tableInstructions.h"

#ifndef utils
#define utils

int addArith(int addr1, int addr2);
int subArith(int addr1, int addr2);
int mulArith(int addr1, int addr2);
int divArith(int addr1, int addr2);
int nbArith(int value);
int addplpl(int addr);
int affect(char * var, int addr_value);
int cond(int addr1, int addr2, int op);
int preIf(int addrCond);
void postIf(int line);
int preWhile(int addrCond);
void postWhile(int line);
int preElse();
void postElse(int line);


#endif