'''
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
'''
import sympy

def digit_rotations(x):
    # returns a list of results from rotating the digits in x
    xstr = str(x)
    rotations = []
    for i in range(len(xstr)):
        left = xstr[:i]
        right = xstr[i:]
        rotation = int(right + left)
        rotations.append(rotation)
    return rotations
#print(digit_rotations(197))  # [197, 971, 719]


def all_primes(numlist):
    # returns Frue if all of the numbers in numlist are prime, False otherwise
    for x in numlist:
        if not sympy.isprime(x):
            return False
    return True


def is_circular_prime(x):
    # returns True if x is a circular prime, False otherwise
    rotations = digit_rotations(x)
    return all_primes(rotations)
#print(is_circular_prime(197))  # True

counter = 0
for x in range(1, int(1e6)):
    if sympy.isprime(x):
        if(is_circular_prime(x)):
            counter += 1

print(counter)  # 55
