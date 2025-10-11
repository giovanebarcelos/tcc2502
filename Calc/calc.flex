import java_cup.runtime.*;

%%
%class Lexer
%cup
%line 
%column

digit = [0-9]
number = {digit}+
ws = [ \t\n\r]

%%

"+" { return new Symbol(sym.PLUS, yyline, yycolumn);}
"-" { return new Symbol(sym.MINUS, yyline, yycolumn);}
{number} { return new Symbol(sym.NUMBER, 
                             yyline, yycolumn, yytext());}
{ws} { /* Ignore */ }
. { System.err.println("Caracter é ilegal: '" + 
                        yytext() + "'"); }
<<EOF>> {return new Symbol(sym.EOF, yyline, yycolumn);}
