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
from functools import reduce
import operator
import sympy
import numpy as np

FACTORS = 4
MAXPRIME = int(1e3)

primes = list(sympy.primerange(0, MAXPRIME))
combinations = list(itertools.combinations(primes, FACTORS))
print("combinations collected...")

sorted_combs = []
combarr = np.array(combinations)
prod = np.prod(combarr, 1)
sorted_combs.extend(prod.tolist())  # get all the products
# multiply by each prime a second time
powers = (np.transpose(combarr) * prod).flatten().tolist()
sorted_combs.extend(powers)

sorted_combs = sorted(list(set(sorted_combs)))
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
print(first)  #
