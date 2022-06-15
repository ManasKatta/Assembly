**************************************
*
* Name: Manas Katta
* PawPrint ID: 14340652
* Date: 4/7/2021
* Lab5
*
*Program description:
*an assembly language program which will
*calculate if each number stored in a table is a prime number or not, 
*and will store the prime byte in an array PRIME. 
*The actual prime calculation (setting the prime byte to 1 if the number is a
*prime while setting it to 0 if it is not prime) 
*has to be implemented in a subroutine. The sentinel
*for the input (N) table is $FF. 
*
* Pseudocode of Main Program:
*
*int main()
*{
*    int array[]= {3,23,6,15,255};
*    int j = 0;
*    int prime_array[3];
*    int* array_ptr = &array[0];
*    int* prime_ptr = &prime_array[0];
*    while(*array_ptr != 255)
*    {
*        *(prime_ptr) = prime(*(array_ptr));
*        array_ptr++;
*        prime_ptr++;
*        
*    }
*    
*    for(int i = 0; i<=3; i++)
*    {
*        printf("%d, ", prime_array[i]);
*    }
*
*}
*
*
*---------------------------------------
*
* Pseudocode Subroutine
*
*int prime(int x)
*{
*    int dividend = x;
*    int remainde=0;
*    int prime_flag=1;
*    int i = 2;
*	
*    if(x==1)
*    {
*        prime_flag = 0;
*    }
*    else
*    {
*	while(i<x)
*	{
*	  dividend = x;
*        while(dividend>=i)
*    		{
*        		dividend -= i;
*    		}
*    	remainde = dividend;
*    	if(remainde == 0)
*    		{
*    		    prime_flag=0;
*    		}
*   	i++;
*    }
*	
*
*    return prime_flag;
*}
*

*	
***************************************
* start of data section

	ORG $B000
N	FCB     1, 2, 11, 14, 31, 32, 37, 241, 251, 252, $FF     
SENTIN	EQU	$FF
    
	ORG $B010
PRIME	RMB       10   

* define any other variables that you might need here
* remember that your subroutine must not access any of these variables, including
* N and PRIME

	ORG $C000
	LDS	#$01FF		initialize stack pointer
* start of your program
* start of your program
	LDX	#N
	LDY	#PRIME
WHILEE				
	LDAA	0,X
	CMPA	#SENTIN	while (array[j] != 255)
	BEQ	ENDWLEE
	LDAA	0,X
	PSHX			push X onto the stack
	JSR	CPRIME
	PULA			pull the return variable into the a register
	PULX			pull the address of X
	STAA	0,Y
	INX			increment the pointer
	INY			increment the pointer
	BRA	WHILEE
ENDWLEE
	STOP



* NOTE: NO STATIC VARIABLES ALLOWED IN SUBROUTINE
*       AND SUBROUTINE MUST BE TRANSPARENT TO MAIN PROGRAM


	ORG $D000
* start of your subroutine 
CPRIME	PULX
	DES
	PSHX
	DES
	DES
	DES
	DES
	DES
	TSX
	STAA	0,X 	Number
	STAA	1,X	dividend
	LDAA	#0
	STAA	2,X	Remainder
	LDAA	#1
	STAA	3,X	primeflag
	LDAA	#2
	STAA	4,X	i
IF	LDAA	0,X		if(NUMBER==1)
	CMPA	#1
	BNE	ELSE
THEN	LDAA	#0		Prime = 0
	STAA	3,X
	BRA	ENDIF
ELSE	
WHILE	LDAA	4,X		while(i<NUMBER)
	CMPA	0,X
	BHS	ENDWLE
	LDAA	0,X		dividend = NUMBER
	STAA	1,X
	LDAA	1,X
WHILE2	CMPA	4,X		while(dividend >= i)
	BLO	ENDWLE2
	SUBA	4,X		dividend -= i
	BRA	WHILE2
ENDWLE2
	STAA	2,X		remainder = dividend
IF2	LDAA	2,X		if(remainder == 0)
	CMPA	#0
	BNE	ENDIF2
THEN2
	LDAA	#0		Prime_Flag = 0
	STAA	3,X
ENDIF2
	INC	4,X		i++
	BRA	WHILE
ENDWLE
ENDIF
	LDAA	3,X
	STAA	7,X
	INS
	INS
	INS
	INS
	INS
	RTS
