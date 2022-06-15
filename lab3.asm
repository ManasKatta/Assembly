**************************************
*
* Name:
* PawPrint ID:
* Date:
* Lab3
*
* Program description:
*
* Pseudocode:
*
*#include <stdio.h>
*#define N 23
*int main()
*{
*    int dividend = N;
*    int remainde=0;
*    int prime_flag=1;
*    int i = 2;
*	
*    if(N==1)
*    {
*        prime_flag = 0;
*    }
*    else
*    {
*	while(i<N)
*	{
*	  dividend = N;
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
*	if(prime_flag==1)
*	{
*	    printf("%d is a prime number", N);
*	}
*	else
*	{
*	    printf("%d is not a prime number", N);
*	}
*    }
*
*}
*
*
**************************************

* start of data section

	ORG $B000
N	FCB     3 
    
    
	ORG $B010
PRIME		RMB    1 
DIVIDEND	RMB 	1
I		RMB	1	  
REMAINDER	RMB	1

* define any other variables that you might need here

	ORG $C000
* start of your program
	LDAA	N		Dividend = N
	STAA	DIVIDEND
	CLR	REMAINDER	Remainder = 0
	LDAA	#1		Prime = 1
	STAA	PRIME
	LDAA	#2		I = 2
	STAA	I
IF	LDAA	N		if(N==1)
	CMPA	#1
	BNE	ELSE
THEN	LDAA	#0		Prime = 0
	STAA	PRIME
	BRA	ENDIF
ELSE	
WHILE	LDAA	I		while(i<N)
	CMPA	N
	BHS	ENDWLE
	LDAA	N		dividend = N
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
	LDAA	#0		Prime = 0
	STAA	PRIME
ENDIF2
	INC	I		i++
	BRA	WHILE
ENDWLE
ENDIF
	STOP

	