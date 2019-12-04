		.global main

		.data
		STRING:.asciz "ABC12D"
		.align
		SUBSTR:.asciz "123"
		.align
		PRESENT: .word 0x00000000
		.align

		.text
main: LDR R0, =STRING 
	  LDR R1, =SUBSTR
	  LDR R7, =PRESENT
	  MOV R6, #0

//NOT EQUAL
NOT_EQUAL: 
		LDRB R4, [R0], #1 
		Add R6, #1	
ITERATE:
		MOV R8,#0
		LDR R1,=SUBSTR	
		LDRB R5,[R1], #1
		CMP R4,#0	
		BEQ OUTPUT
		CMP R4,R5	
		BEQ POS
		B NOT_EQUAL

EQUAL: LDRB R4,[R0],#1
		Add R6,#1			
		LDRB R5,[R1],#1		
		CMP R4,#0
		BEQ OUTPUT
		CMP R5,#0
		BEQ OUTPUT
		CMP R4,R5
		BNE ITERATE
		B EQUAL
	  
POS: MOV R8, R6
		 B EQUAL

OUTPUT : STR R8, [R7]