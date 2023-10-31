%option noyywrap
%option nodefault
%option yylineno

%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int yyerror(char* erro){
}
%}

NUM  [0-9]
MAJOR  {NUM}+
MINOR_PATCH  (\.{NUM}+)+
SUFIXO  \-(a|b|rc){NUM}*
NUMERO_VERSAO  {MAJOR}({MINOR_PATCH}{SUFIXO}?)?
VIRGULA \,
BARRA \|
%%

{MAJOR} printf("TAGMAJOR encontrado cadeia reconhecida: %s\n", yytext);
{MINOR_PATCH} printf("TAGMINOR_PATCH encontrado cadeia reconhecida: %s\n", yytext);
{SUFIXO} printf("TAGSUFIXO encontrado cadeia reconhecida:%s\n", yytext);
{NUMERO_VERSAO} printf("TAGNUMERO_VERSAO encontrado cadeia reconhecida: %s\n", yytext);
{VIRGULA} ;
{BARRA} ;
<<EOF>>	exit(0);

. { yyerror("Token desconhecido."); }

"\n"	;

%%

int main(){
	yyin = fopen("exemplo.txt", "r");
	yylex();
	return 0;
}
