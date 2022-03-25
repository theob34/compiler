#include "utils.h"
#include "tableSymbole.h"


// ---- FONCTIONS POUR LES OPERATIONS ---- //
int add(int a, int b) {
    int addressResult = addSymboleUnamed();
    
    printf("ADD %d %d %d", addressResult, a, b);
    return addressResult;
}
int sub(int a, int b) {
    int addressResult = addSymboleUnamed();
    printf("SUB %d %d %d", addressResult, a, b);
    return addressResult;
}
int divi(int a, int b) {
    int addressResult = addSymboleUnamed();
    printf("DIV %d %d %d", addressResult, a, b);
    return addressResult;
}
int times(int a, int b){
    int addressResult = addSymboleUnamed();
    printf("MUL %d %d %d", addressResult, a, b);
    return addressResult;
}
int createAddressForNb(int a) {
    int addressResult = addSymboleUnamed();
    printf("AFC %d %d", addressResult, a);
    return addressResult;
}
int addplpl(int a) {
    int addressOne = addSymboleUnamed();
    printf("AFC %d 1", addressOne);
    return add(a, addressOne);
}


