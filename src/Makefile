GRM=compiler.y
# LEX=compiler_vAffichage.l
LEX=compiler.l
BIN=compiler

CC=gcc
CFLAGS=-Wall -g

OBJ= y.tab.o lex.yy.o main.o utils.o tableInstructions.o tableSymbole.o

all: $(BIN)

%.o: %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

y.tab.c: $(GRM)
	yacc -d $<

lex.yy.c: $(LEX)
	flex $<

$(BIN): $(OBJ)
	$(CC) $(CFLAGS) $(CPPFLAGS) $^ -o $@

clean:
	rm $(OBJ) y.tab.c y.tab.h lex.yy.c