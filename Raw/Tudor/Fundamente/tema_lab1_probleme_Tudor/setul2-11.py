def haveproperty(x, y):
    l1=[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    l2= [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    while x>0:
        l1[x%10]=1
        x=x//10
    while y>0:
        l2[y % 10]=1
        y=y//10
    for i in range(0,len(l1)):
        if l1[i]!=l2[i]:
            return False
    return True
print("Check if 2 numbers have the same digits in base 10")
print("Input 2 numbers: ")
n=int(input())
m=int(input())
print(haveproperty(n,m))