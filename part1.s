	.global MAIN
	.data
	STR_LEN: .word 3
	
	S2:.ascii "ZZZ"
	
	S1:.ascii "AAA"
	
	S1_GREATER: .word 0x00000000
	.text
		
MAIN:
	 LDR R0, =S1
	 LDR R1, =S2
	 LDR R3, =STR_LEN
	 LDR R6, [R3]
	 LDR R7, =S1_GREATER

//ITERATE AND CALCULATE STRING CHAR CODE VALUE
ITERATE: CMP R6, #0
	 BEQ OUTPUT	
	 LDRB R4, [R0], #1
	 LDRB R5, [R1], #1
	 SUB R6, R6, #1
	 CMP R4, R5
	 BGE ITERATE
	 
//S1 IS LESS THAN S2
S1_LESSER:
	MOV R8, #0xffffffff
	
OUTPUT:
	STR R8, [R7]