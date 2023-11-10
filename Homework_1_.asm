.data
	.word 23,83,67
.text				
	lui s0,0x10010
	lw a0,0(s0) #first integer 
	lw a1,4(s0) #second integer
	lw a2,8(s0) #third integer
	
check:	 blt a1,a0,swap_1 #check first two
continue:blt a2,a1 swap_2 # check second two
	 
	 add a0,a0,a1 #
	 sub a1,a0,a1 #put the median in a0 so to print it
	 sub a0,a0,a1 #
	 
	 addi a7,zero,1 
	 ecall #print it
	 addi a7,zero,10
	 ecall #end
	
	swap_1:
		add a0,a0,a1#
		sub a1,a0,a1# swap the first two
		sub a0,a0,a1#
		beq zero,zero,continue #check the second two
	swap_2:
		add a2,a2,a1
		sub a1,a2,a1
		sub a2,a2,a1
		beq zero,zero,check #check the first two because the could be different