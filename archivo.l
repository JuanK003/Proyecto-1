%{
    #include<stdlib.h>
    #include<string.h>
    int linea=1, entero=0, flotante=0, booleano;
    int identif = 0;
    int palres = 0;
    int cadenas = 0;
    int operador = 0;
    int caracteres = 0;
    int lexemas = 0;

    void CaractesExtra(char texto[])
    {
        int caractesEx=strlen(texto);
        caracteres=caracteres+caractesEx;
    }

%}

%%
("using"|"function"|"return"|"end"|"println"|"for"|"in"|"push!"|"Int8"|"Int16"|"Int32"|"Int64"|"Float16"|"Float32"|"Float64"|"collect"|"repeat"|"struct"|"mutable"|"break")" "   {palres++; CaractesExtra(yytext); printf("Palabra reservada %s encontrada en la linea %i\n\n", yytext, linea);}
" ""-"{0,1}[0-9]{1,}                                {entero++; lexemas++; CaractesExtra(yytext);printf("\nNumero entero %s y esta en la linea %i\n\n", yytext, linea);}
" ""-"{0,1}[0-9]{1,}"."[0-9]{1,}                    {flotante++; lexemas++; CaractesExtra(yytext); printf("Numero flotante %s y esta en la linea %i\n\n", yytext, linea);}
("true"|"false")                                    {booleano++; lexemas++; CaractesExtra(yytext); printf("El dato Booleano %s y esta en la linea %i\n\n", yytext, linea);}
\"[\32-\255]{1,}\"                               {cadenas++; lexemas++; CaractesExtra(yytext); printf("La cadena %s y esta en la linea %i\n\n", yytext, linea);}
[0-9a-zA-Z]{1,}                                     {identif++; lexemas++; CaractesExtra(yytext); printf("El identificador %s esta en la linea %i\n\n", yytext, linea); }
" "("+"|"-"|"*"|"/"|"÷"|"\\"|"^"|"%"|"~"|"&&"|"!")     {operador++; lexemas++; CaractesExtra(yytext); printf("El operador %s encontrado en la linea %i\n\n", yytext, linea);}
\n                                                  {linea++ ;}
.                                                   {caracteres++;}
%%

int main(){
    yylex();
    
    printf("--------------------------------------------\n");
    printf("\t\t TOTALES \t\t\t\t\n\n");
    printf("El total de palabras reservadas = %i\n", palres);
    printf("El total de identificadores = %i\n", identif);
    printf("El total de Enteros son = %i\n", entero);
    printf("El total de Flotantes son = %i\n", flotante);
    printf("El total de Booleanos son = %i\n", booleano);
    printf("El total de Cadenas son = %i\n", cadenas);
    printf("El total de Operadores son = %i\n\n", operador);
    
    printf("El total de Lexemas = %i\n", lexemas);
    printf("Cantidad de lineas de codigo = %i\n", linea);
    printf("Total de caracteres = %i\n", caracteres);
    return 0;
}