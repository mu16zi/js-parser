%{
    #include <stdbool.h>
    #include <stdlib.h>
    #include <stdio.h>
    #include <ctype.h>
    #include <string.h>

    int yylex(void);
    void yyerror(char *);

    extern int line;
    extern int column;

    char *jserror = "- [Customized Error]"
    char *jserrotype = 'ERROR TYPE'

    struct variables {
        char *name;
        union {
            double double_var;
            bool boolean_var;
            int int_value;
            char *string_value;
        } reference;
        struct variables *next;
    }

    typedef struct variables variables;

    extern struct variables *store;

    variables *putvar (char *, char*);
    char* getvar (char const *);

    variables *store;
    void display(variables *store);
%}

%token END_OF_FILE 0
%token <string_value> CONSOLE
%token BREAK
%token CASE
%token CATCH
%token CLASS
%token CONST
%token CONTINUE
%token DEBUGGER
%token DEFAULT
%token DELETE
%token DO
%token ELSE
%token EXPORT
%token EXTENDS
%token FINALLY
%token FOR
%token FUNCTION
%token IF
%token IMPORT
%token IN
%token INSTANCEOF
%token LET
%token NEW
%token OF
%token RETURN
%token SUPER
%token SWITCH
%token THIS
%token THROW
%token TRY
%token TYPEOF
%token VAR
%token VOID
%token WHILE
%token WITH
%token YIELD
%token ENUM
%token AWAIT
%token IMPLEMENTS
%token INTERFACE
%token PACKAGE
%token PRIVATE
%token PROTECTED
%token PUBLIC
%token <string_value> LITERAL_NULL
%token <string_value> LITERAL_TRUE
%token <string_value> LITERAL_FALSE
%token <string_value> LITERAL_UNDEFINED
%token <string_value> LITERAL_NAN
%token UNARY_ADD
%token UNARY_ADD
%token UNARY_SUBTRACT
%token LOGICAL_NOT
%token MULTIPLY
%token DIVIDE
%token MODULO
%token ADD
%token SUBTRACT
%token EQUAL
%token NOT_EQUAL
%token EXACTLY_EQUAL
%token NOT_EXACTLY_EQUAL
%token LEFT_SHIFT
%token SIGNED_RIGHT_SHIFT
%token UNSIGNED_RIGHT_SHIFT
%token LESS_THAN
%token GREATER_THAN
%token LESS_THAN_OR_EQUAL
%token GREATER_THAN_OR_EQUAL
%token QUESTION_MARK
%token COLON
%token LOGICAL_AND
%token LOGICAL_OR
%token BITWISE_AND
%token BITWISE_OR
%token BITWISE_XOR
%token BITWISE_NOT
%token ASSIGNMENT
%token ADDITION_ASSIGNMENT
%token SUBTRACTION_ASSIGNMENT
%token MULTIPLICATION_ASSIGNMENT
%token DIVISION_ASSIGNMENT
%token MODULUS_ASSIGNMENT
%token EXPONENTIATION_ASSIGNMENT
%token LEFT_SHIFT_ASSIGNMENT
%token SIGNED_RIGHT_SHIFT_ASSIGNMENT
%token UNSIGNED_RIGHT_SHIFT_ASSIGNMENT
%token BITWISE_AND_ASSIGNMENT
%token BITWISE_XOR_ASSIGNMENT
%token BITWISE_OR_ASSIGNMENT
%token ARROW_FUNCTION
%token RIGHT_PAREN
%token LEFT_PAREN
%token RIGHT_BRACE
%token LEFT_BRACE
%token RIGHT_BRACKET
%token LEFT_BRACKET
%token COMMA
%token FULL_STOP
%token ELLIPSIS
%token SEMICOLON
%token DOUBLE_QUOTE
%token SINGLE_QUOTE
%token <string_value> VALUE_INTEGER
%token <string_value> VALUE_DOUBLE
%token <string_value> VALUE_STRING
%token <string_value> IDENTIFIER
%token LINE_FEED
%token CARRIAGE_RETURN
%token LINE_SEPARATOR
%token PARAGRAPH_SEPARATOR