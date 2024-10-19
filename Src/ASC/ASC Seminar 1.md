#7_10_2024 

Bing Chilling
```wasm

segment data use 32  class = data
a dd 5
tem equ 10

segment data use 32 class = code
```

# Data types
Byte - b
Word - w
DoubleWord - d
QuadWord - q

# Rules of memory allocation

You wrote the following code:
```asm
a dd 0x5
b db 3, 5, 6, 10
```
The computer puts in memory the variables next to each other
And so we have `$a` at memory location 0x00
And `$b` at memory location 0x10
> **Why?**
> Because size of `$a` is 16 (0x10)  

# Syntax

## Declaring values
#### In base 10
`0`
#### In base 16
`0x00`
`00h
#### In binary
 `00000000b`

## Declare
`$variable_name d# $value` where # is dataType
#### Byte
`db` - 8 bits
#### Word
`dw` - 16 bits
#### DoubleWord
`dd` - 32 bits
#### QuadWord
`dq` - 64 bits

#### Arrays
`d# $v1, $v2, $v3, ...`

#### Data address
`0x000000`

## Constants
`$constant_name equ $value`

## Move
Moves stuff around memory
>nerfed getter

`mov $dest , _type $source`

if `_type` is not defined then it will use the size of `$dest`
### Rules
1. $dest has to be register
2. $dest and $source must have the same size

## Add
Adds a value
`ADD $register, $value`
## Subtraction
Subtracts a value
`SUB $register, $value`


## Multiplication
multiplies register EAX with a value
`mul $value`
**Important!**  it only works for positive numbers

## Reserve
`$var_name res# $number_of_#_to_reserve` where # is dataType


# Predefined keywords
## Registers
##### Modifiable
EAX, EBX, ECX, EDX
ESI, EDI, ESP, EBP

##### Not modifiable 
EIP
E-Flags

**Important!**  all registers have 32 bits 

# Data representation

| Data values between | 0-7 | 8-15 | 16-31 | 32-63 |
| ------------------- | --- | ---- | ----- | ----- |
| Values              | 05  | 00   | 00    | 00    |

```
a dd 0x5
b db 3,5,6,10
```

| memory | 05  | 00  | 00  | 00  | 03  | 05  | 06  | 0A  |
| ------ | --- | --- | --- | --- | --- | --- | --- | --- |
|        |     |     |     |     |     |     |     |     |

## Register

| EAX | EAX | EAX | EAX |
| --- | --- | --- | --- |
|     |     | AX  | AX  |
|     |     | AH  | AL  |
| 00  | 00  | 00  | 00  |

`AL` and `AH` have byte size
`AX` has word size
`EAX` has double_word size

# Rules
Destination and value cannot be both in memory 



