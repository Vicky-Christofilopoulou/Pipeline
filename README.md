# Pipeline
The objective of the task is to design a MIPS microprocessor with pipelining for the best possible energy efficiency, meaning the highest performance per unit of power, as a project in "Computer Architecture 2" course. 

The implementation and the results are explained on this pdf.
[ReadMe.pdf](https://github.com/Vicky-Christofilopoulou/Pipeline/files/14550253/ReadMe.pdf)

# MIPS-single-cycle 
The program, the performance of which you will evaluate, processes a list of N integers [i1, i2, ..., iN], which is unsorted, and any integer can appear in the list any number of times. Your program should find:
1. the minimum integer in the list (MIN)
2. the maximum integer in the list (MAX)
3. the count of even numbers in the list (EVEN)
4. the count of odd numbers in the list (ODD)
5. the count of zeros in the list (ZERO)
6. the count of integers whose absolute value is divisible by 3 (DIV3)
7. the count of integers whose absolute value is divisible by 5 (DIV5).

# MIPS-pipeline-simple
The next step is to design the MIPS-pipeline-simple processor, which has five stages of pipelining and a clock rate of 300 MHz. Its power consumption is 25 watts. It only has data hazards detection and stall addition but no forwarding. For control hazards, it also has detection and stall addition (stall-on-branch), and branch resolution occurs in the EX stage.

# MIPS-pipeline-turbo 
The final step is to design a more aggressive processor, MIPS-pipeline-turbo, which also has five stages of pipelining, a clock rate of 300 MHz, and consumes 35 watts. For data hazards, it has detection and forwarding. For control hazards, it uses 2-bit branch prediction and a 5-bit BHT. Branch resolution occurs in the ID stage.

## Contributors of the project :
* [Zannis Vidalis](https://github.com/ZannisVidalis)
* [Eleni Feslian](https://github.com/EleniFeslian)
* [Vicky-Christofilopoulou]( https://github.com/Vicky-Christofilopoulou )
