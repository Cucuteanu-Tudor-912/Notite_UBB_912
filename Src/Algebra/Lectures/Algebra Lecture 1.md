#03_10_2024

# Relations

## Definition
A triple $r = (A, B, R)$, where $A, B$ are sets and 
$R \subseteq A \times B = \{ (a,b)\ |\ a \in A,\ b \in B \}$
is called a **relation**
#### Domain
Set $A$ is the **Domain**
#### Codomain
Set $B$ is the **Codomain**
#### Graph
Set $R$ is the **Graph** of the relation $r$

## Properties
if $A=B$ then relation $r$ is called **Homogenous**

## Notations
let $(a,b) \in R$  ($R$ is the relation)
We can write $\mathbf a \ r\ b$ and it is read as 
**a has the relation r to b** 
or
**a and b are related with respect to the relation r**


-----
# Relation classes
## Definition
##### 1.
Let $r = (A,B,R)$ be a relation and let $X \subseteq A$.
The set $r(X) =\{b \in B\ |\ \exists \ x \in X : x\ r\ b \}$
is called the **relation class of $X$ with respect to $r$**

##### 2.
Let $x \in X$ .
$r \langle x \rangle = r(\{x\}) = \{b\in B\ |\ x\ r\ b\}$

For those who didn't understand what 2. wanted to say here is an explanation
$r\langle x\rangle$ is the Graph of relation $r$ applied on subset $\{x\}$ 
<details > 
<summary >In Romanian</summary>
<p>r<x>  este imaginea relatiei r pe submultimea compusa din elementul {x} </p>
</details>

-----------------

# Types of relations

## Void relation
$o=(A,B,\emptyset)$ is the **void relation**
## Universal relation
$u=(A,B,A\times B)$ is the **universal relation**
## Homogenous relation
$h=(A,A,A)$ is the **homogenous relation**
## Equality relation
$\delta = (A,A,\Delta A)$ where $\Delta A = \{(a,a)\ |\ a\in A \}$ is the **equality relation**



-----
# Functions

## Definition
A relation $r = (A,B,R)$ is called a **function** if $\forall a\in A\ \vert\ r\langle A\rangle \ \vert\ =1$ 
> It is called a function if for all elements in A there is only one element related to them



----
# Partitions
## Definition 
Let $A$ be a non empty set
The family of non-empty subsets  of $A$ is called a **partition** of $A$ if:
1. The union of all subsets in the family covers the whole $A$
2. The subsets don't intersect


----
# Quotient sets


