%{
#include<stdio.h>
#include<stdlib.h>
extern int yylineno;
%}

%token COMMENT
%token TAKEOFF
%token LAND
%token WHILE
%token FOR
%token IF
%token ELSE
%token CALL
%token RETURN
%token READINCLINATION
%token READALTITUDE
%token READTEMPERATURE
%token READACCELERATION
%token TOGGLECAMERA
%token TAKEPICTURE
%token READTIME
%token CONNECTCOMPUTER
%token UP
%token DOWN
%token TURNRIGHT
%token TURNLEFT
%token FORWARD
%token BACK
%token LEFTFLIP
%token RIGHTFLIP
%token FRONTFLIP
%token BACKFLIP
%token FUNCTION
%token READ
%token PRINT
%token AND
%token OR
%token PLUS
%token MINUS
%token MULTIPLIER
%token DIVIDER
%token SEMICOLON
%token COMMA
%token OPEN_P
%token CLOSE_P
%token OPEN_B
%token CLOSE_B
%token EQUALS
%token EQUAL
%token NOTEQUALS
%token BIGGER
%token SMALLER
%token BIGGEROREQUALS
%token SMALLEROREQUALS
%token CONST
%token INT
%token DOUBLE
%token CHAR
%token STR
%token BOOLEAN
%token TIME
%token VOID
%token TIMEVALUE
%token INTEGERVALUE
%token DOUBLEVALUE
%token CHARVALUE
%token STRINGVALUE
%token BOOLEANVALUE
%token IDENTIFIER
%token CARET

%start program

%%

program: TAKEOFF statements LAND
	   ;

statements: statement SEMICOLON
          | statements statement SEMICOLON
          | COMMENT
          | statement SEMICOLON COMMENT
          | statements statement SEMICOLON COMMENT
	      ;

statement: matched
	     | unmatched
	     ;

simple_statement: declaration
				| initialization
				| declare_function
				| call_function
				| reading
				| printing
				;

matched: matched_if
	   | matched_while
	   | matched_for
	   | simple_statement
	   ;

unmatched: unmatched_if
		 | unmatched_while
		 | unmatched_for
		 ;

matched_if: IF OPEN_P comparisons CLOSE_P OPEN_B matched CLOSE_B ELSE OPEN_B matched CLOSE_B
    	  ;

unmatched_if: IF OPEN_P comparisons CLOSE_P OPEN_B statements CLOSE_B
			| IF OPEN_P comparisons CLOSE_P OPEN_B matched CLOSE_B ELSE OPEN_B unmatched CLOSE_B
			;

declaration: type IDENTIFIER
		   ;

type: BOOLEAN
	| INT
	| CHAR
	| STR
	| DOUBLE
	| TIME
	;

types: BOOLEANVALUE
	 | INTEGERVALUE
	 | CHARVALUE
	 | STRINGVALUE
	 | DOUBLEVALUE
	 | TIMEVALUE
	 ;

initialization: assignment
			  | type IDENTIFIER EQUAL arithmetic_expression
			  | constant EQUAL arithmetic_expression
			  ;

constant: CONST type IDENTIFIER
		;

arithmetic_expression: arithmetic_expression PLUS term
					 | arithmetic_expression MINUS term
					 | term
					 ;

term: term MULTIPLIER power
    | term DIVIDER power
    | power
    ;

power: factor CARET power
	 | factor
	 ;

factor: OPEN_P arithmetic_expression CLOSE_P
	  | types
	  | call_function
	  | IDENTIFIER
	  ;

comparisons: comparison
		   | comparison operator comparisons
		   ;

operator: AND
		| OR
		;

assignment: IDENTIFIER EQUAL arithmetic_expression
		  ;

matched_for: FOR OPEN_P initialization SEMICOLON comparisons SEMICOLON assignment CLOSE_P OPEN_B matched CLOSE_B
		   ;

unmatched_for: FOR OPEN_P initialization SEMICOLON comparisons SEMICOLON assignment CLOSE_P OPEN_B unmatched CLOSE_B
			 ;

matched_while: WHILE OPEN_P comparisons CLOSE_P OPEN_B matched CLOSE_B
			 ;

unmatched_while: WHILE OPEN_P comparisons CLOSE_P OPEN_B unmatched CLOSE_B
			   ;

comparison: IDENTIFIER comparison_operator IDENTIFIER
		  | IDENTIFIER comparison_operator types
		  | types comparison_operator types
		  | types comparison_operator IDENTIFIER
		  | types comparison_operator call_function
		  | IDENTIFIER comparison_operator call_function
		  | call_function comparison_operator call_function
		  | call_function comparison_operator IDENTIFIER
		  | call_function comparison_operator types
		  ;

comparison_operator: EQUALS
				   | NOTEQUALS
				   | BIGGER
				   | SMALLER
				   | BIGGEROREQUALS
				   | SMALLEROREQUALS
				   ;

return_statement: RETURN IDENTIFIER SEMICOLON
				| RETURN types SEMICOLON
				| RETURN SEMICOLON
				;

declare_function: FUNCTION type IDENTIFIER OPEN_P parameters CLOSE_P OPEN_B statements return_statement CLOSE_B
				| FUNCTION type IDENTIFIER OPEN_P CLOSE_P OPEN_B statements return_statement CLOSE_B
				;

parameter: IDENTIFIER
		 | types
		 | type IDENTIFIER
		 ;

parameters: parameter
		  | parameter COMMA parameters
		  | call_function
		  ;

call_function: CALL IDENTIFIER OPEN_P parameters CLOSE_P
			 | CALL IDENTIFIER OPEN_P CLOSE_P
			 | primitive_functions
			 ;

reading: READ OPEN_P IDENTIFIER CLOSE_P
	   ;

printing: PRINT OPEN_P IDENTIFIER CLOSE_P
		| PRINT OPEN_P types CLOSE_P
		| PRINT OPEN_P call_function CLOSE_P
		;

primitive_functions: call_read_inclination
                   | call_read_altitude
                   | call_read_temperature
                   | call_read_acceleration
                   | call_toggle_camera
                   | call_take_picture
                   | call_read_time
                   | call_connect_computer
                   | call_up
                   | call_down
                   | call_turn_right
                   | call_turn_left
                   | call_forward
                   | call_back
                   | call_left_flip
                   | call_right_flip
                   | call_front_flip
                   | call_back_flip
                   ;

call_read_inclination: CALL READINCLINATION OPEN_P CLOSE_P
					 ;

call_read_altitude: CALL READALTITUDE OPEN_P CLOSE_P
				  ;

call_read_temperature: CALL READTEMPERATURE OPEN_P CLOSE_P
					 ;

call_read_acceleration: CALL READACCELERATION OPEN_P CLOSE_P
					  ;

call_toggle_camera: CALL TOGGLECAMERA OPEN_P CLOSE_P
				  ;

call_take_picture: CALL TAKEPICTURE OPEN_P CLOSE_P
				 ;

call_read_time: CALL READTIME OPEN_P CLOSE_P
			  ;

call_connect_computer: CALL CONNECTCOMPUTER OPEN_P STRINGVALUE COMMA STRINGVALUE CLOSE_P
					 | CALL CONNECTCOMPUTER OPEN_P IDENTIFIER COMMA IDENTIFIER CLOSE_P
					 ;

call_up: CALL UP OPEN_P INTEGERVALUE CLOSE_P
	   | CALL UP OPEN_P IDENTIFIER CLOSE_P
	   ;

call_down: CALL DOWN OPEN_P INTEGERVALUE CLOSE_P
		 | CALL DOWN OPEN_P IDENTIFIER CLOSE_P
		 ;

call_turn_right: CALL TURNRIGHT OPEN_P INTEGERVALUE CLOSE_P
			   | CALL TURNRIGHT OPEN_P IDENTIFIER CLOSE_P
			   ;

call_turn_left: CALL TURNLEFT OPEN_P INTEGERVALUE CLOSE_P
			  | CALL TURNLEFT OPEN_P IDENTIFIER CLOSE_P
			  ;

call_forward: CALL FORWARD OPEN_P INTEGERVALUE CLOSE_P
			| CALL FORWARD OPEN_P IDENTIFIER CLOSE_P
			;

call_back: CALL BACK OPEN_P INTEGERVALUE CLOSE_P
		 | CALL BACK OPEN_P IDENTIFIER CLOSE_P
		 ;

call_left_flip: CALL LEFTFLIP OPEN_P CLOSE_P
			  ;

call_right_flip: CALL RIGHTFLIP OPEN_P CLOSE_P
			   ;

call_front_flip: CALL FRONTFLIP OPEN_P CLOSE_P
			   ;

call_back_flip: CALL BACKFLIP OPEN_P CLOSE_P
			  ;

%%
#include "lex.yy.c"
	void yyerror(char *s) { printf("%s on line %d\n", s, yylineno); }

int main()
	{
	if(yynerrs < 1){
		printf("Parsing is successful\n");
	}
	return	yyparse();
}