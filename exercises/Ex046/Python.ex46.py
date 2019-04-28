'''
A composite number is a positive integer that can be formed by multiplying
two smaller positive integers.
It was proposed by Christian Goldbach that every odd composite number
can be written as the sum of a prime and twice a square.

9 = 7 + 2 * 1^2
15 = 7 + 2 * 2^2
21 = 3 + 2 * 3^2
25 = 7 + 2 * 3^2
27 = 19 + 2 * 2^2
33 = 31 + 2 * 1^2

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as
the sum of a prime and twice a square?
'''
import sympy
import numpy as np

MAXN = int(1e2) + 10

primes = list(sympy.primerange(0, MAXN))

rng = np.arange(2, int(MAXN ** 0.5))
x, y = np.meshgrid(rng, rng)
prod = np.multiply(x, y)
odds = prod[prod%2!=0]
odds = np.unique(odds)

print(primes)
print(odds)
