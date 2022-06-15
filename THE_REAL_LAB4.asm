***************************************
*
* Name: Manas Katta
* PawPrint ID: 14340652
* Date: 3/23/21
* Lab 4
*
* Program description:
*an assembly language program which will calculate if each number stored in a table is a prime number or not,
*and will store the prime byte in an array PRIME. 
*The actual prime calculation (setting the prime byte to 1 if the number is a prime while setting it to 0 if it is not prime) 
*has to be implemented in a single subroutine using the algorithm outlined in Lab3. 
*The 1-byte prime result has to be passed back to the main program, 
*which stores them in the PRIME array The sentinel for the input (N) table is $FF.  
*
*
*Pseudocode of Main Program:
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
*---------------------------------------
*
*Pseudocode of Subroutine:
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
N	FCB     8, 34, 31, 100, 121, 200, 221, 222, 233, 254, $FF
SENTIN	EQU	$FF
    
	ORG $B010
PRIME	RMB     10   

* define any other variables that you might need here
* remember that your subroutine must not access any of these variables, including
* N and PRIME

	ORG $C000
	LDS	#$01FF		initialize stack pointer
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

	ORG	$D000
* define any other variables that you might need here using RMB (not FCB or FDB)
* remember that your main program must not access any of these variables, including
REMAINDER	RMB	1
I		RMB	1
PRIME_FLAG	RMB	1
NUMBER		RMB	1
DIVIDEND	RMB	1

	ORG $E000
* start of your subroutine 
CPRIME	STAA	NUMBER		Dividend = NUMBER
	STAA	DIVIDEND
	CLR	REMAINDER	Remainder = 0
	LDAA	#1		Prime = 1
	STAA	PRIME_FLAG
	LDAA	#2		I = 2
	STAA	I
IF	LDAA	NUMBER		if(NUMBER==1)
	CMPA	#1
	BNE	ELSE
THEN	LDAA	#0		Prime = 0
	STAA	PRIME_FLAG
	BRA	ENDIF
ELSE	
WHILE	LDAA	I		while(i<NUMBER)
	CMPA	NUMBER
	BHS	ENDWLE
	LDAA	NUMBER		dividend = NUMBER
	STAA	DIVIDEND
	LDAA	DIVIDEND
WHILE2	CMPA	I		while(dividend >= i)
	BLO	ENDWLE2
	SUBA	I		dividend -= i
	BRA	WHILE2
ENDWLE2
	STAA	REMAINDER	remainder = dividend
IF2	LDAA	REMAINDER	if(remainder == 0)
	CMPA	#0
	BNE	ENDIF2
THEN2
	LDAA	#0		Prime_Flag = 0
	STAA	PRIME_FLAG
ENDIF2
	INC	I		i++
	BRA	WHILE
ENDWLE
ENDIF
	LDAA	PRIME_FLAG
	PULX			pull x into stack
	PSHA			push prime flag onto stack
	CLRA	
	PSHX			pushes x back onto stack
	RTS




