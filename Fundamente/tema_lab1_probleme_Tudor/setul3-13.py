def isprime(z):
    ok=True
    if z<2:
        return False
    elif z==2:
        return True
    else:
        for i in range(2,z//2+1):
            if z%i==0:
                ok=False
    return ok
def nth_elem(m):
    x=2
    m=m-1
    while m>0:
        if isprime(x):
            m=m-1
            if m == 0:
                return x
        else:
            for i in range(2,x//2+1):
                if x%i==0 and isprime(i):
                    m=m-1
                    if m==0:
                        return i
        x=x+1
print("Determine n-th element from the sequence of prime divisors")
n=int(input("Enter a number: "))
print("The n-th element in the sequence of prime divisors is", end=" ")
if n==1:
    print(1)
else:
    print(nth_elem(n))