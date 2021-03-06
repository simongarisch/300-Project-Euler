'''
Pentagonal numbers are generated by the formula, P(n) = n(3n-1)/2
The first ten pentagonal numbers are:
1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...

It can be seen that P4 + P7 = 22 + 70 = 92 = P8.
However, their difference, 70 - 22 = 48, is not pentagonal.

Find the pair of pentagonal numbers, Pj and Pk, for which their
sum and difference are pentagonal and D = abs(Pk - Pj) is minimised
what is the value of D?
'''

def pentagonal_number(n):
    return n*(3*n-1)/2

#pentas = [pentagonal_number(n) for n in range(1,11)]
#print(pentas)  # [1, 5, 12, 22, 35, 51, 70, 92, 117, 145]
# search for the first occurrence

D = None
n = 0
pentas = []
while D is None:
    n += 1
    penta = pentagonal_number(n)  # the largest number so far
    for p in pentas:
        if penta - p in pentas:
            if penta - 2*p in pentas:
                D = penta - 2*p
                break
    pentas.append(penta)

print(D)  # 5,482,660
