.org    0x80020000 
.text
.globl _start
.set noat
.set noreorder
//.set reorder
.ent _start
 
_start:
		

			#t0 loop counter
			#s0 = min
			#s1 = max
			#s2 zero counter
			#s3 even counter
			#s4 odd counter
			#s5 div5 counter
			#s6 div3 counter
		
			la $t1, n					#load address of the size of the array
			addi $t5, $t5, 5				#for divisor = 5
			addi $t6, $t6, 3				#for divisor = 3
			lw $t2, 0($t1)					#number of elements in t2
			la $a0, arr					#load address of first element
			add $s3, $zero, $zero 				#even counter
			add $s4, $zero, $zero 				#odd counter
			lw $t3, 0($a0)					#t3 contains current array element

		
loop:			beq $t0, $t2, ex				#if counter = n, exit the loop 
			slt $t4, $t3, $s0				#if current element < min
			beq $t4, $zero, Max				
			sub $s0, $s0, $s0				#clear min reg
			add $s0, $t3, $zero				#set new min
		
Max:			slt $t4, $t3, $s1				#if curr element < max
			bne $t4, $zero, cont 				
			sub $s1, $s1, $s1				#clear max reg
			add $s1, $t3, $zero				#set new max
		

cont:			bne $t3, $zero, cont1				#check if current element is zero
			addi $s2, $s2, 1				#increase zero counter		

cont1:			andi $t4, $t3, 0x0001     			#return 1 if the number is odd, zero if even. 
			beq $t4, $zero, DIV5
			addi $s4, $s4, 1				#increase odd counter	
		
DIV5:			div $t3, $t5					#check if divisible by 5
			mfhi $t7
			bne $t7, $zero, DIV3
			addi $s5,$s5,1

DIV3:			div $t3, $t6					#check if divisible by 3
			mfhi $t7
			addi $a0, $a0, 4				#re-order to decreased data hazards
									#increase array address 
			bne $t7, $zero, next				#if number mod 3 != 0,go to next
			addi $s6,$s6,1

next:			addi $t0, $t0, 1				#re-order to decreased data hazards
									#increase loop counter
			lw $t3, 0($a0)					#contains next array element
			j loop
		
		
ex: 			sub $s3, $t2, $s4				#Evens = number of elements - odds 
		
			la $a0, min					#load address of min label
			li $v0, 10					#re-order to decreased data hazards

			#Store the results in memory:
   			sw $s0, 0($a0)					
   			sw $s1, 4($a0)
   			sw $s2, 8($a0)
   			sw $s3, 12($a0)
   			sw $s4, 16($a0)
   			sw $s5, 20($a0)
   			sw $s6, 24($a0)

			syscall	
	
	
	
.end _start

.data
.org	0x10000000
n	:	 .word 100        			#Memory word for number of array elements
arr	:	 .word 1477, -3519, 6323, -4151, -862, -1075, 7185, -4775, 3496, -3575, -2571, 8737, 0, 6643, 7608, -2800, -2252, 6105, -1921, -3882, 7936, 7543, 0, 3288, 7060, 5783, 1505, 2232, -3174, -4870, 391, -2149, -1008, -1507, 4626, -891, 3709, -1581, 4845, 3253, 998, 4383, -1355, 6636, 3903, -4863, -413, 4076, -3138, -3436, -261, -487, -5167, -3176, 4190, 1560, -2533, 28, 2934, -3391, 3646, 6741, -3704, 5665, -2074, -4785, 1453, 3784, 8827, -4413, -621, -1198, -2391, 6375, 7427, 1603, 6343, -154, 497, 8148, -1768, -4066, 6941, -1500, -3471, -260, 8719, 301, -3755, 5777, 7735, 8813, 841, 2115, -2957, -2891, 774, 5504, 4730, 6318
min	:	 .word 
max	:	 .word 
even	:	 .word
odd	:	 .word
zero	:	 .word
div3	:	 .word
div5	:	 .word
