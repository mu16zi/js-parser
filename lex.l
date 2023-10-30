%{
    #include <string.h>
%}

DIGIT [0-9]
CHAR [$_a-zA-Z]

%x MULTILINE_STRING

%%

console                 { return CONSOLE; }
break                   { return BREAK; }
case                    { return CASE; }
catch                   { return CATCH; }
class                   { return CLASS; }
const                   { return CONST; }
continue                { return CONTINUE; }
debugger                { return DEBUGGER; }
default                 { return DEFAULT; }
delete                  { return DELETE; }
do                      { return DO; }
else                    { return ELSE; }
export                  { return EXPORT; }
extends                 { return EXTENDS; }
finally                 { return FINALLY; }
for                     { return FOR; }
function                { return FUNCTION; }
if                      { return IF; }
import                  { return IMPORT; }
in                      { return IN; }
instanceof              { return INSTANCEOF; }
let                     { return LET; }
new                     { return NEW; }
of                      { return OF; }
return                  { return RETURN; }
super                   { return SUPER; }
switch                  { return SWITCH; }
this                    { return THIS; }
throw                   { return THROW; }
try                     { return TRY; }
typeof                  { return TYPEOF; }
var                     { return VAR; }
void                    { return VOID; }
while                   { return WHILE; }
with                    { return WITH; }
yield                   { return YIELD; }
enum                    { return ENUM; }
await                   { return AWAIT; }
implements              { return IMPLEMENTS; }
interface               { return INTERFACE; }
package                 { return PACKAGE; }
private                 { return PRIVATE; }
protected               { return PROTECTED; }
public                  { return PUBLIC; }
null                    { return LITERAL_NULL; }
true                    { yylval.string_value = "true"; return LITERAL_TRUE; }
false                   { yylval.string_value = "false"; return LITERAL_FALSE; }
undefined               { yylval.string_value = "undefined"; return LITERAL_UNDEFINED; }
NaN                     { yylval.string_value = "NaN"; return LITERAL_NAN; }
"++"                    { return UANRY_ADD; }
"--"                    { return UANRY_SUBTRACT; }
"!"                     { return LOGICAL_NOT; }
"*"                     { return MULTIPLY; }
"/"                     { return DIVIDE; }
"%"                     { return MODULO; }
"+"                     { return ADD; }
"-"                     { return SUBTRACT; }
"=="                    { return EQUAL; }
"!="                    { return NOT_EQUAL; }
"==="                   { return STRICT_EQUAL; }
"!=="                   { return STRICT_NOT_EQUAL; }
"<<"                    { return LEFT_SHIFT; }
">>"                    { return SIGNED_RIGHT_SHIFT; }
">>>"                   { return UNSIGNED_RIGHT_SHIFT; }
"<"                     { return LESS_THAN; }
"<="                    { return LESS_THAN_OR_EQUAL; }
">"                     { return GREATER_THAN; }
">="                    { return GREATER_THAN_OR_EQUAL; }
"?"                     { return QUESTION_MARK; }
":"                     { return COLON; }
"&&"                    { return LOGICAL_AND; }
"||"                    { return LOGICAL_OR; }
"&"                     { return BITWISE_AND; }
"|"                     { return BITWISE_OR; }
"^"                     { return BITWISE_XOR; }
"~"                     { return BITWISE_NOT; }
"="                     { return ASSIGNMENT; }
"+="                    { return ADDITION_ASSIGNMENT; }
"-="                    { return SUBTRACTION_ASSIGNMENT; }
"*="                    { return MULTIPLICATION_ASSIGNMENT; }
"/="                    { return DIVISION_ASSIGNMENT; }
"%="                    { return MODULUS_ASSIGNMENT; }
"**="                   { return EXPONENTIATION_ASSIGNMENT; }
"<<="                   { return LEFT_SHIFT_ASSIGNMENT; }
">>="                   { return SIGNED_RIGHT_SHIFT_ASSIGNMENT; }
">>>="                  { return UNSIGNED_RIGHT_SHIFT_ASSIGNMENT; }
"&="                    { return BITWISE_AND_ASSIGNMENT; }
"^="                    { return BITWISE_XOR_ASSIGNMENT; }
"|="                    { return BITWISE_OR_ASSIGNMENT; }
"=>"                    { return ARROW_FUNCTION; }
")"                     { return RIGHT_PAREN; }
"("                     { return LEFT_PAREN; }
"}"                     { return RIGHT_BRACE; }
"{"                     { return LEFT_BRACE; }
"]"                     { return RIGHT_BRACKET; }
"["                     { return LEFT_BRACKET; }
","                     { return COMMA; }
"."                     { return FULL_STOP; }
"..."                   { return ELLIPSIS; }
";"                     { return SEMICOLON; }
"\""                    { return DOUBLE_QUOTE; }
"'"                     { return SINGLE_QUOTE; }
{DIGIT}+\.{DIGIT}+      { return VALUE_DOUBLE; }
{DIGIT}+                { yylval.string_value = strdup(yytext); return VALUE_INTEGER; }
\"(\\.|[^\\"])*\"       { yylval.string_value = strdup(yytext); return VALUE_STRING; } 
\'(\\.|[^\\"])*\'       { yylval.string_value = strdup(yytext); return VALUE_STRING; }
\`                      { BEGIN(MULTILINE_STRING); string_buffer = strcat(NULL, malloc(sizeof(char*))); }
<MULTILINE_STRING>\`    { BEGIN(INITIAL); yylval.string_value = strdup(string_buffer); return VALUE_STRING; free(string_buffer); }
{CHAR}({DIGIT}|{CHAR})* { yylval.string_value = strdup(yytext); return INDENTIFIER; }
"\n"                    {}
"\r"                    {}
[ \t]                   {}
<<EOF>>                 { return END_OF_FILE; }

%%