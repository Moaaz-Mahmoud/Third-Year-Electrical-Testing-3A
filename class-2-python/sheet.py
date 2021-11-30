import math
def p1():
    a, b, c = map(int, input().split())
    s = (a+b+c)/2
    print(math.sqrt(s*(s-a)*(s-b)*(s-c)))
def p2():
    n = int(input())
    f = 1
    for i in range(1, n+1): f *= i
    print(f)
def p3():
    n = int(input())
    if n%2 == 0: print("Even")
    else: print("Odd")
def p4():
    n = int(input())
    for i in range(n):
        print(f'-----{i}:')
        for j in range(n+1):
            print(i*j)
