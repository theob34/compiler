#include <stdio.h>

void yyerror(char *s) { fprintf(stderr, "%s\n", s); }
int main(void) {
  printf("Compiler\n"); // yydebug=1;
  yyparse();
  return 0;
}