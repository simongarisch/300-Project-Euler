'''
The first two consecutive numbers to have two distinct prime factors are:

14 = 2 * 7
15 = 3 * 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2^2 * 7 * 23
645 = 3 * 5 * 43
646 = 2 * 17 * 19.

Find the first four consecutive integers to have four distinct prime factors each.
What is the first of these numbers?
'''
import itertools
import sympy
import numpy as np

TARGET_FACTORS = 4
MAXPRIME = int(1e3)


primes = list(sympy.primerange(0, MAXPRIME))

def mult_factors(factors_list):
    # return the results we get from multiplying prime factors
    result = 1
    for prime in factors_list:  # straight multiplication
        result *= prime
    results = [result]

    for prime in factors_list:  # where we have a ^2
        results.append(result * prime)
    return results


sequence = 0
n = 0
while True:
    n += 1
    factors = 0
    factors_list = []
    for prime in primes:
        if n % prime == 0:
            factors += 1
            factors_list.append(prime)
        if prime > n:
            break

    if factors == TARGET_FACTORS:
        multiples = mult_factors(factors_list)
        if n in multiples:
            sequence += 1
        else:
            sequence = 0
    else:
        sequence = 0

    if sequence == TARGET_FACTORS:
        break

first = n - TARGET_FACTORS + 1
print(first)  # 134,043
