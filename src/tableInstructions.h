#define SIZE_INSTR 128
#define SIZE_TABLE 100
#ifndef tableInstructions
#define tableInstructions

typedef struct instruction{
    char inst[SIZE_INSTR] ;
    int destAddress ;
    int addr1 ;
    int addr2 ;
} instruction ;

instruction tableInstruction[SIZE_TABLE] ;

int freePtr = 0 ; //Adresse de la première case mémoire disponible pour mon programme
int nbInstructions = 0 ; //Nombre d'instructions dans la table

void ti_addArith() ; 
void ti_mulArith() ;
void ti_divArith() ;
void ti_subArith() ;

void ti_nbArith(int v) ;
void ti_varArith(int v) ;

void ti_insert(char op, int addr_dest, int addr1, int addr2 ) ;