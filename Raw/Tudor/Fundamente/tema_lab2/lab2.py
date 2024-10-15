"""
interactive menu in the console
CHOOSE OPTION
1 generate a list of random numbers (also show the list)(maybe display the sorted list)
2 search (make sure the list is sorted)
3 sort1
4 sort2
5 exit
"""
# length of the random list given by user, random number 0-1000 (with random module) - DONE
# import random random.randint() - DONE
# don't crash the program if u choose 2/3/4 before 1 - DONE
# for sort, we print every change of the list for visualisation of the algorithms - DONE
# user can select the number of steps at which point we show the changes - DONE
# one function for each algorithm - 2 parameters (list; for search nr to be searched, for sort nr of steps) - DONE
# exponential search - DONE
# cocktail sort - DONE
# comb sort - DONE
import random

#command 1 using randint
def generate_random_list(l, n):
    for i in range(n):
        l.append(random.randint(0, 1000))
    print("Your list: ", l)

#binary search needed for exponential search
def binary_search(l, st, dr, elem):
    mid = (st + dr) // 2
    if st > dr:
        return -1
    if l[mid] == elem:
        return mid
    elif elem < l[mid]:
        return binary_search(l, st, mid - 1, elem)
    else:
        return binary_search(l, mid + 1, dr, elem)

#command 2
def exponential_search_list(x, elem):
    n = len(x)
    i = 1
    while i < n and x[i] < elem:
        i *= 2
    print(elem, "is on position", binary_search(x, i // 2, min(i, n - 1), elem))

#command 3
def cocktail_sort(x, step):
    n = len(x)
    num_step = 0
    st = 0
    dr = n - 1
    done = False
    while not done:
        done = True
        for i in range(st, dr):
            num_step = num_step + 1
            if x[i] > x[i + 1]:
                done = False
                if num_step >= step and num_step % step == 0:
                    print("Step", num_step, ":", "\n", x)
                    print("We are currently on position", i)
                    x[i], x[i + 1] = x[i + 1], x[i]
                    print(x, "\n", "We swapped", x[i], x[i + 1],"\n")
                else:
                    x[i], x[i + 1] = x[i + 1], x[i]

            else:
                if num_step >= step and num_step % step == 0:
                    print("Step", num_step, ":", "\n", x)
                    print("We are currently on position", i)
                    print("No swaps","\n")
        dr = dr - 1
        if done:
            break
        done = True
        for i in range(dr, st, -1):
            num_step = num_step + 1
            if x[i] > x[i + 1]:
                done = False
                if num_step >= step and num_step % step == 0:
                    print("Step", num_step, ":", "\n", x)
                    print("We are currently on position", i)
                    x[i], x[i + 1] = x[i + 1], x[i]
                    print(x, "\n", "We swapped", x[i], x[i + 1],"\n")
                else:
                    x[i], x[i + 1] = x[i + 1], x[i]
            else:
                if num_step >= step and num_step % step == 0:
                    print("Step", num_step, ":", "\n", x)
                    print("We are currently on position", i)
                    print("No swaps","\n")

    print("The final result is:", "\n", x)

def getGap(gap):
    gap = (gap * 10)//13
    if gap < 1:
       return 1
    return gap

def comb_sort(x, step):
    n=len(x)
    gap=n
    done=False
    num_steps = 0
    while not done or gap != 1:
        gap=getGap(gap)
        done=True
        for i in range(0,n-gap):
            num_steps=num_steps+1
            if x[i] > x[i + gap]:
                if num_steps >= step and num_steps % step == 0:
                    print("Step", num_steps, ":", "\n", x)
                    print("We are currently on position", i)
                    x[i], x[i + gap] = x[i + gap], x[i]
                    print(x, "\n", "We swapped", x[i], x[i + gap], "\n")
                done=False
            else:
                if num_steps >= step and num_steps % step == 0:
                    print("Step", num_steps, ":", "\n", x)
                    print("We are currently on position", i)
                    print("No swaps", "\n")




created_list = False
already_sorted = False
print("Welcome to your 2-nd assignment menu!", "\n",
      "1.Generate random list of n numbers", "\n",
      "2.Search using the Exponential Search algorithm", "\n",
      "3.Sort the list using Cocktail Sort (and also see every n steps!)", "\n",
      "4.Sort the list using Comb Sort (and also see every n steps!)", "\n",
      "5.Exit")
while True:
    user_action = int(input("Enter your choice: "))
    if user_action == 1:
        l = []
        n = int(input("Enter the number of elements in the list: "))
        generate_random_list(l, n)
        created_list = True
        already_sorted = False
    if user_action == 2:
        if not already_sorted and created_list:
            print("You have to sort the list first!")
        if not created_list:
            print("Can't search without a list!")
        elif already_sorted and created_list:
            val = int(input("Enter the element to be searched: "))
            exponential_search_list(l, val)
    if user_action == 3:
        if already_sorted:
            print("Already sorted. Please generate a new list")
        if not created_list:
            print("Can't sort without a list!")
        elif not already_sorted and created_list:
            step = int(input("Enter n. Every n steps will be shown: "))
            cocktail_sort(l, step)
            already_sorted = True
    if user_action == 4:
        if already_sorted:
            print("Already sorted. Please generate a new list")
        if not created_list:
            print("Can't sort without a list!")
        elif not already_sorted and created_list:
            step = int(input("Enter n. Every n steps will be shown: "))
            comb_sort(l, step)
            already_sorted = True
    if user_action == 5:
        print("Goodbye!")
        exit()
