#17_10_2024


# ALU
Arithmetic and Logic unit

## Operations performed by the ALU
- Arithmetic
- Bit shifting
- Logical operations (And, Or, Xor, Not)

in addition to these operations, ALU will set accordingly the values from the EFlags register


!! the software size on n bits is the size of the registers and word size
!! the engineering size of processor is the communication channels (buses) size



# Flags
- OF - Overflow
		google it at your own risk
- DF - Direction flag
		denotes direction of string operations
- IF  - Interrupt flag
		when set to 0, nothing can stop the execution
- TF - Trap
 		dengerous! Za warudo!
		execution step by step when trap flag is set to 1
- SF - Sign
		first bit of result
- ZF - Zero flag
		shows if the last op result was zero
- AF - Auxiliary
		magic
- PF - Parity flag
		used in data transmission shenanigans
- CF - Carry
# Representations
A representation in base 2 always has 2 values (interpretations in base 10)
>they may coincide


# Definitions
## LPO
Last performed operation
## Nibble
half of a byte
>Nigger
## Critical section
section that cannot be interrupted
denoted by the operations between if =0  and if = 1