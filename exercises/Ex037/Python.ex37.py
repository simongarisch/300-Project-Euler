'''
The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
'''
from sympy import isprime

STOP = 11

def istruncatable(n):
    ''' returns true for primes that are both truncatable
        from left to right and right to left.
    '''
    nstr = str(n)
    for i in range(len(nstr)):
        left = nstr[:i]
        right = nstr[i:]
        #print(left, right)
        if left != "":
            if not isprime(int(left)):
                return False
        if not isprime(int(right)):
            return False
    return True

#print(istruncatable(3797))  # True

found = 0
totsum = 0
n = 8
while found < STOP:
    if isprime(n):
        if istruncatable(n):
            found += 1
            totsum += n
    n += 1

print(totsum)  # 748,317
