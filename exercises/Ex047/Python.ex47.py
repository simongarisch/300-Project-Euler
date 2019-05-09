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
import numpy as np

TARGET_FACTORS = 3
MAXPRIME = int(2e2)

primes = list(sympy.primerange(0, MAXPRIME))
#combinations = list(itertools.combinations(primes, FACTORS))
#print("combinations collected...")

def mult_factors(factors_list):
    # return the results we get from multiplying prime factors
    result = 1
    for prime in factors_list:  # straight multiplication
        result *= prime
    results = [result]

    for prime in factors_list:  # where we have a ^2
        results.append(result * prime)
    return results


sequence = 1
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
        if n in mult_factors(factors_list):
            sequence += 1
        else:
            sequence = 1
    else:
        sequence = 1

    if sequence == TARGET_FACTORS:
        break

print(n - TARGET_FACTORS)

'''
sorted_combs = []
combarr = np.array(combinations)
prod = np.prod(combarr, 1)
# multiply by each prime a second time
powers = (np.transpose(combarr) * prod).flatten()
sorted_combs = np.sort(np.unique(np.append(prod, powers))).tolist()
print("sorted prime factors...")

sequence = 1
prev_int = 0
for index, i in enumerate(sorted_combs):
    if i == prev_int + 1:
        sequence += 1
        #print(index, i, sequence)
    else:
        sequence = 1
    if sequence == FACTORS:
        break
    prev_int = i

first = sorted_combs[index - FACTORS + 1]
'''
