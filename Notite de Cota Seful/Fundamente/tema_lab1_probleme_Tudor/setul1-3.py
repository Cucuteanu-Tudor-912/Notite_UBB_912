def nrm(m):
    x=0
    l=[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    while m>0:
        l[m%10]=l[m%10]+1
        m=m//10
    if l[0]>0:
        for i in range(1,len(l)):
            if l[i]>0:
                x=i
                l[i]=l[i]-1
                break
    for i in range(0,len(l)):
        while l[i]>0:
            x=x*10
            x=x+i
            l[i]=l[i]-1
    return x
print("Smalles number with the same digits")
n=int(input("Introduce a number: "))
print("Your output is: ",nrm(n))