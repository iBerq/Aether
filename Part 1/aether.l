%option noyywrap

COMMENT ~~.*
BEGIN BEGIN
END END
WHILE while
FOR for
IF if
ELSE else
CALL call
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
TYPE int|double|str|char|boolean
READ read
PRINT print
AND &&
OR \|\|
PLUS \+
MINUS \-
MULTIPLIER \*
DIVIDER \/
NEWLINE \n
SEMICOLON ;
COMMA ,
OPENPARANTHESIS \(
CLOSEPARANTHESIS \)
OPENBRACKET \{
CLOSEBRACKET \}
EQUALS ==
EQUAL =
NOTEQUALS !=
BIGGER >
SMALLER\<
BIGGEROREQUALS >=
SMALLEROREQUALS <=
DIGIT [0-9]
INT [0-9]+
DOUBLE [0-9]+\.[0-9]+
CHAR \'[^\\\']\'
STR \"([^\\\"]|\\\"|\\\n|\\\\)*\"
BOOLEAN TRUE|FALSE
IDENTIFIER [a-z]+([a-zA-Z]|[0-9]|_)*

%%

{COMMENT} printf("COMMENT ");
{BEGIN} printf("BEGIN ");
{END} printf("END\n");
{WHILE} printf("WHILE ");
{FOR} printf("FOR ");
{IF} printf("IF ");
{ELSE} printf("ELSE ");
{CALL} printf("CALL ");
{READINCLINATION} printf("READINCLINATION ");
{READALTITUDE} printf("READALTITUDE ");
{READTEMPERATURE} printf("READTEMPERATURE ");
{READACCELERATION} printf("READACCELERATION ");
{TOGGLECAMERA} printf("TOGGLECAMERA ");
{TAKEPICTURE} printf("TAKEPICTURE ");
{READTIME} printf("READTIME ");
{CONNECTCOMPUTER} printf("CONNECTCOMPUTER ");
{UP} printf("UP ");
{DOWN} printf("DOWN ");
{TURNRIGHT} printf("TURNRIGHT ");
{TURNLEFT} printf("TURNLEFT ");
{FORWARD} printf("FORWARD ");
{BACK} printf("BACK ");
{LEFTFLIP} printf("LEFTFLIP ");
{RIGHTFLIP} printf("RIGHTFLIP ");
{FRONTFLIP} printf("FRONTFLIP ");
{BACKFLIP} printf("BACKFLIP");
{FUNCTION} printf("FUNCTION ");
{TYPE} printf("TYPE ");
{READ} printf("READ ");
{PRINT} printf("PRINT ");
{AND} printf("AND ");
{OR} printf("OR ");
{PLUS} printf("PLUS ");
{MINUS} printf("MINUS ");
{MULTIPLIER} printf("MULTIPLIER ");
{DIVIDER} printf("DIVIDER ");
{NEWLINE} printf("\nNEWLINE ");
{SEMICOLON} printf("SEMICOLON ");
{COMMA} printf("COMMA ");
{OPENPARANTHESIS} printf("OPENPARANTHESIS ");
{CLOSEPARANTHESIS} printf("CLOSEPARANTHESIS ");
{OPENBRACKET} printf("OPENBRACKET ");
{CLOSEBRACKET} printf("CLOSEBRACKET ");
{EQUALS} printf("EQUALS ");
{EQUAL} printf("EQUAL ");
{NOTEQUALS} printf("NOTEQUALS ");
{BIGGER} printf("BIGGER ");
{SMALLER} printf("SMALLER ");
{BIGGEROREQUALS} printf("BIGGEROREQUALS ");
{SMALLEROREQUALS} printf("SMALLEROREQUALS ");
{DIGIT} printf("DIGIT ");
{INT} printf("INT ");
{DOUBLE} printf("DOUBLE ");
{CHAR} printf("CHAR ");
{STR} printf("STR ");
{BOOLEAN} printf("BOOLEAN ");
{IDENTIFIER} printf("IDENTIFIER ");


%%

int main(){
	yylex();
	return 0;
}
