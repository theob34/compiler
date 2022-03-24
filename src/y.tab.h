/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    tMAIN = 258,
    tIF = 259,
    tWHILE = 260,
    tFOR = 261,
    tPO = 262,
    tPF = 263,
    tAO = 264,
    tAF = 265,
    tRETURN = 266,
    tPV = 267,
    tELSE = 268,
    tIS = 269,
    tADD = 270,
    tTIMES = 271,
    tDIV = 272,
    tINF = 273,
    tSUP = 274,
    tDIFF = 275,
    tSUB = 276,
    tOU = 277,
    tET = 278,
    tEGAL = 279,
    tINT = 280,
    tCONST = 281,
    tVOID = 282,
    tCOMA = 283,
    tPRINTF = 284,
    tVARIABLE = 285,
    tERROR = 286,
    tPLONE = 287,
    tNB = 288
  };
#endif
/* Tokens.  */
#define tMAIN 258
#define tIF 259
#define tWHILE 260
#define tFOR 261
#define tPO 262
#define tPF 263
#define tAO 264
#define tAF 265
#define tRETURN 266
#define tPV 267
#define tELSE 268
#define tIS 269
#define tADD 270
#define tTIMES 271
#define tDIV 272
#define tINF 273
#define tSUP 274
#define tDIFF 275
#define tSUB 276
#define tOU 277
#define tET 278
#define tEGAL 279
#define tINT 280
#define tCONST 281
#define tVOID 282
#define tCOMA 283
#define tPRINTF 284
#define tVARIABLE 285
#define tERROR 286
#define tPLONE 287
#define tNB 288

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 29 "compiler.y"
 int nb; 

#line 126 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
