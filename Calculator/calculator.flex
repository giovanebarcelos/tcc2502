import java_cup.runtime.Symbol;

%%

%class Scanner
%unicode
%cup
%line
%column
%public

digito = [0-9]
letra = [a-zA-Z]
inteiro = {digito}+
fimdeLinha = \r|\n|\r\n
espaco = {fimdeLinha} | [ \t\f]
opMais = "+"

%%

{inteiro} { 
 Integer aux = Integer.parseInt (yytext());
 return new Symbol (sym.INTEIRO, aux); 
}
{opMais} { return new Symbol(sym.MAIS); }
"-" { return new Symbol(sym.MENOS);}
"/" { return new Symbol(sym.DIV);}
"*" { return new Symbol(sym.MULT);}
"%" { return new Symbol(sym.MOD);}
";" { return new Symbol(sym.PTVIRG);}
"(" { return new Symbol(sym.ABRE_PARENT);}
")" { return new Symbol(sym.FECHA_PARENT);}
{espaco} { /* despreza */ }
/* Caractere inválido */
.|[\t\r\n]+ { 
 return new Symbol(sym.EOF, yyline, yycolumn, yytext()); }