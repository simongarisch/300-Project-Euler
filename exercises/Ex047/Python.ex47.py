'''
The first two consecutive numbers to have two distinct prime factors are:

14 = 2 * 7
15 = 3 * 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2^2 * 7 * 23
645 = 3 * 5 * 43
646 = 2 * 17 * 19.

Find the first four consecutive integers to have four distinct prime factors each. What is the first of these numbers?
'''
import itertools
import sympy

FACTORS = 2
MAXPRIME = int(1e2)

primes = list(sympy.primerange(0, MAXPRIME))
combinations = list(itertools.combinations(primes, FACTORS))


def is_factor(n, *args):
    # returns true if n is a factor of args, false otherwise
    # we'll also have to go through a number of power combinations
    mult = 1

    for arg in args:
        mult *= arg
    if mult == n:
        return True

    for arg in args:
        if mult * arg == n:
            return True

    return False
#print(is_factor(15, 3, 5))       # True
#print(is_factor(644, 2, 7, 23))  # True

n = 0
sequence = 0

while True:
    n += 1
    #print(n)
    has_prime_factors = False
    combs = [c for c in combinations if c < int(n/2)]
    for combination in combs:
        if is_factor(n, *combination):
            #print("%d tagged" % n)
            has_prime_factors = True

    if has_prime_factors:
        sequence += 1
    else:
        sequence = 0

    if sequence == FACTORS:
        break

first = n - FACTORS + 1
print(first)  #
