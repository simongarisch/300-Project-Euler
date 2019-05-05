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
MAXPRIME = int(1e3)

primes = list(sympy.primerange(0, MAXPRIME))
combinations = list(itertools.combinations(primes, FACTORS))

CombinationsMult = namedtuple("CombinationsMult", "mult primes")
sorted_combs = []
for comb in combinations:
    sorted_combs.append(CombinationsMult(reduce(operator.mul, comb, 1), comb))

sorted_combs = sorted(sorted_combs, key=operator.attrgetter("mult"))
#print(sorted_combs)
#[CombinationsMult(mult=6, primes=(2, 3)),
# CombinationsMult(mult=10, primes=(2, 5)),
# CombinationsMult(mult=14, primes=(2, 7)), ...


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
print(is_factor(15, 3, 5))       # True
print(is_factor(644, 2, 7, 23))  # True


for i in sorted_combs:
    p = i.primes
    if 2 in p and 17 in p and 19 in p:
        print(is_factor(646, *i.primes))

def subset_combinations(mult_list, n):
    # takes a list of CombinationsMult objects and returns
    # only those were the mult attribute is <= n
    # mult list should be a sorted list by the mult attribute
    subset = []
    for value in mult_list:
        if value.mult <= n:
            subset.append(value)
        else:
            break
    return subset


n = 0
sequence = 0
# start with those combinations objects where mult <= 100
combs = subset_combinations(sorted_combs, 100)

while True:
    n += 1
    #print(n)
    if n % 100 == 0:
        combs = subset_combinations(sorted_combs, n)

    has_prime_factors = False
    # no need to search all of the prime combinations
    # only those were the prime multiplication <= n
    for combination in combs:
        if is_factor(n, *combination.primes):
            print("%d tagged" % n)
            has_prime_factors = True
            break

    if has_prime_factors:
        sequence += 1
    else:
        sequence = 0

    if sequence == FACTORS:
        break

first = n - FACTORS + 1
print(first)  #
