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
def prime_sum(a):
    if (a<=2):
        print ("Number can't be written as a sum of 2 prime numbers")
    else:
        found=False
        for cont in range(2,int(a//2+1)):
            if isprime(cont)==True and isprime(a-cont)==True:
                print(a,"= ",cont,"+",a-cont)
                found=True
        if found==False:
            print("Number can't be written as a sum of 2 prime numbers")
print("Two number prime sum for value N", "\n")
n=int(input("Input your value: "))
prime_sum(n)