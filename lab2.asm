*********************************
*Name: Manas Katta
*Pawprint: 14340652
*Date: 2/25/21
*Lab 2
*
*Program description: This program should compute and store both the quotient and the remainder, if the divisor is not zero; if
*the divisor is zero, This program should store $FF in both the quotient and remainder locations. This
*program should also handle the case where the divisor is larger than the dividend. The dividend, divisor,
*quotient, and remainder are all 8-bit unsigned integers. For example, if the dividend is 81 and the divisor
*is 24, the resulting quotient is 3 and the remainder is 9. 
*
* Pseudocode:
*int main()
*{
*    int dividend = 98;
*    int divisor = 201;
*    int counter=0;
*    int quotient=0;
*    int remainde=0;
*	
*    if(divisor == 0)
*	{
*		quotient = $FF;
*		remainde = $FF;
*	}    
*
*    
*    else
*	{
*    		while(dividend>=divisor)
*    		{
*        		dividend -= divisor;
*        		i++;
*    		}
*    		remainde = dividend;
*    		quotient = counter;
*	}
*    
*    printf("quotient = %d\n", quotient);
*    printf("remainder = %d\n", remainde);
*    
*}
*
*
**************************************

* start of data section

	ORG $B000
DIVIDEND	FCB        81         The dividend
DIVISOR	FCB        24	         The divisor.

	ORG $B010
QUOTIENT	RMB       1         The quotient.
REMAINDER	RMB       1         The remainder.
COUNTER	RMB	   1		The counter.
* define any other variables that you might need here

	ORG $C000
* start of your program
	CLR	QUOTIENT	clears all variables 
	CLR	REMAINDER
	CLR	COUNTER
IF				
	LDAA	DIVISOR	this if statement tests if the divisor is equal to 0 and acts accordingly
	CMPA	#0
	BNE	ELSE
THEN				
	LDAA	#$FF
	STAA	QUOTIENT
	STAA	REMAINDER
	BRA	ENDIF
ELSE				
	LDAA	DIVIDEND	if the divisor is not zero then the following while loop subtracts the divisor from the dividned until the dividend is no longer greater than the divisor
WHILE	CMPA	DIVISOR
	BLO	ENDWLE
	SUBA	DIVISOR
	INC	COUNTER	the counter is incremented to keep track of the quotient
	BRA	WHILE
ENDWLE	
	STAA	REMAINDER	whats left of the dividend after the while loop is stored into the remainder variable
	LDAA	COUNTER	the counter is also the quotient and it is stored in the quotient variable
	STAA	QUOTIENT
ENDIF
	STOP			end of program

