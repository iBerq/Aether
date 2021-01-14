COMMENT ~~.*
TAKEOFF takeoff
LAND land
WHILE while
FOR for
IF if
ELSE else
CALL call
RETURN return
READINCLINATION readInclination
READALTITUDE readAltitude
READTEMPERATURE readTemperature
READACCELERATION readAcceleration
TOGGLECAMERA toggleCamera
TAKEPICTURE takePicture
READTIME readTime
CONNECTCOMPUTER connectComputer
UP up
DOWN down
TURNRIGHT turnRight
TURNLEFT turnLeft
FORWARD forward
BACK back
LEFTFLIP leftFlip
RIGHTFLIP rightFlip
FRONTFLIP frontFlip
BACKFLIP backFlip
FUNCTION function
READ read
PRINT print
AND &&
OR \|\|
PLUS \+
MINUS \-
MULTIPLIER \*
DIVIDER \/
CARET \^
NEWLINE \n
SEMICOLON ;
COMMA ,
OPEN_P \(
CLOSE_P \)
OPEN_B \{
CLOSE_B \}
EQUALS ==
EQUAL =
NOTEQUALS !=
BIGGER >
SMALLER <
BIGGEROREQUALS >=
SMALLEROREQUALS <=
CONST const
INT int
DOUBLE double
CHAR char
STR str
BOOLEAN boolean
TIME time
VOID void
TIMEVALUE [0-2][0-9]:[0-5][0-9]:[0-5][0-9]
INTEGERVALUE [+-]?[0-9]+
DOUBLEVALUE [+-]?[0-9]+\.[0-9]+
CHARVALUE \'[^\\\']\'
STRINGVALUE \"([^\\\"]|\\\"|\\\n|\\\\)*\"
BOOLEANVALUE true|false
IDENTIFIER [a-z]+([a-zA-Z]|[0-9]|_)*
%option yylineno
%%
{COMMENT} return COMMENT;
{TAKEOFF} return TAKEOFF;
{LAND} return LAND;
{WHILE} return WHILE;
{FOR} return FOR;
{IF} return IF;
{ELSE} return ELSE;
{CALL} return CALL;
{RETURN} return RETURN;
{READINCLINATION} return READINCLINATION;
{READALTITUDE} return READALTITUDE;
{READTEMPERATURE} return READTEMPERATURE;
{READACCELERATION} return READACCELERATION;
{TOGGLECAMERA} return TOGGLECAMERA;
{TAKEPICTURE} return TAKEPICTURE;
{READTIME} return READTIME;
{CONNECTCOMPUTER} return CONNECTCOMPUTER;
{UP} return UP;
{DOWN} return DOWN;
{TURNRIGHT} return TURNRIGHT;
{TURNLEFT} return TURNLEFT;
{FORWARD} return FORWARD;
{BACK} return BACK;
{LEFTFLIP} return LEFTFLIP;
{RIGHTFLIP} return RIGHTFLIP;
{FRONTFLIP} return FRONTFLIP;
{BACKFLIP} return BACKFLIP;
{FUNCTION} return FUNCTION;
{READ} return READ;
{PRINT} return PRINT;
{AND} return AND;
{OR} return OR;
{PLUS} return PLUS;
{MINUS} return MINUS;
{MULTIPLIER} return MULTIPLIER;
{DIVIDER} return DIVIDER;
{CARET} return CARET;
{SEMICOLON} return SEMICOLON;
{COMMA} return COMMA;
{OPEN_P} return OPEN_P;
{CLOSE_P} return CLOSE_P;
{OPEN_B} return OPEN_B;
{CLOSE_B} return CLOSE_B;
{EQUALS} return EQUALS;
{EQUAL} return EQUAL;
{NOTEQUALS} return NOTEQUALS;
{BIGGER} return BIGGER;
{SMALLER} return SMALLER;
{BIGGEROREQUALS} return BIGGEROREQUALS;
{SMALLEROREQUALS} return SMALLEROREQUALS;
{CONST} return CONST;
{INT} return INT;
{DOUBLE} return DOUBLE;
{CHAR} return CHAR;
{STR} return STR;
{BOOLEAN} return BOOLEAN;
{TIME} return TIME;
{VOID} return VOID;
{TIMEVALUE} return TIMEVALUE;
{INTEGERVALUE} return INTEGERVALUE;
{DOUBLEVALUE} return DOUBLEVALUE;
{CHARVALUE} return CHARVALUE;
{STRINGVALUE} return STRINGVALUE;
{BOOLEANVALUE} return BOOLEANVALUE;
{IDENTIFIER} return IDENTIFIER;
{NEWLINE} ;
[ \t]+;
%%
int yywrap(){
	return 1;
}
