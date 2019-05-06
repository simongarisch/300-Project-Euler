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
from collections import namedtuple
from functools import reduce
import operator
import sympy


FACTORS = 3
MAXPRIME = int(1e2)

primes = list(sympy.primerange(0, MAXPRIME))
combinations = list(itertools.combinations(primes, FACTORS))

CombinationsMult = namedtuple("CombinationsMult", "mult primes")
sorted_combs = []
for comb in combinations:
    # straight multiplication of each prime
    mult = CombinationsMult(reduce(operator.mul, comb, 1), comb)
    sorted_combs.append(mult)
    for prime in comb:
        # in the cases where we have a prime ^2
        sorted_combs.append(CombinationsMult(mult * prime, comb))

sorted_combs = sorted(sorted_combs, key=operator.attrgetter("mult"))
#print(sorted_combs)
#[CombinationsMult(mult=6, primes=(2, 3)),
# CombinationsMult(mult=10, primes=(2, 5)),
# CombinationsMult(mult=14, primes=(2, 7)), ...

integers = []
for item in sorted_combs:
    integers.append(item.mult)  # get all of the factors
print(integers)

sequence = 1
prev_int = 0
for index, i in enumerate(integers):
    if i == prev_int + 1:
        sequence += 1
        #print(index, i, sequence)
    else:
        sequence = 1
    if sequence == FACTORS:
        break
    prev_int = i

first = integers[index - FACTORS + 1]
print(first)  #
