#10_10_2024

The 8 general registers of the ExecutiveUnit #EU 


# Registers
## Definition
Very Small Storage capacities but very fast as access speed with the operands which the processor currently works
#### Sizes
{8, 16, 32, 64}

## Types of registers

#ChadRegisters
### AX
accumulator register

- most used
- is used by most of the operations

**Size** 16 bits
### EAX
extended AX

-------
## EBX
base register
`legacy register`

- starting address of an entity

-----
## ECX
counter register
- mostly used as a numerical upper limit for instructions that need repetitive rounds

---
## EDX
data register

- auxiliary register (used when you need more space)
- frequently used with other registers (mostly with EAX) when the result exceeds a [dw](#DataTypes##In%20assembly###Sizes^dw)

---
---
## ESP
stack pointer
 - points to last element in the stack
## EBP
base pointer
- points to first element in the stack

---

## ESI
source index
- offset1
## EDI
destination index
- offset2

---
```
Stack  |
Queue  | => the 'three' basic data structures
Heap   |
```

# Misc
bit - smallest unit of representation
byte - smallest accessible unit (it has an address :D)

 - 17 registers
	 - 1 flag register
	 - 8 mem register


## Important question
why only 3 of the register are focusing with the stack
and none of them work with Queue and Heap

because it has Lifo ("last in first out") order???
Any running program obeys lifo order in it's execution
because EU's purpose is to run programs ^^^



# Operations

## Addition and Subtraction

$b \pm b \to b$
$w \pm w \to w$
$dd \pm dd \to dd$
$dq \pm dq \to ?$

## Multiplication

**AX -> EDX:EAX**
$b \cdot b \to w$
$w\cdot w \to dd$
$dd\cdot dd \to dq$

## Division
**EDX:EAX ->EAX(result), EDX (remainder)**
$w/b \to b$

# Data types
## Definition
#### General notion
"structure + associated operations"

#### In assembly
The size of the representation
##### Sizes
- 8 bits - byte ^b
- 16 bits - word ^w
- 32 bits - doubleword ^dw
- 64 bits - quadword ^qw

[recurrence](ASC%20Seminar%201.md#Syntax##Declare)
