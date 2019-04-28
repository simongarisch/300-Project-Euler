## Project Euler Exercise 46

A composite number is a positive integer that can be formed by multiplying
two smaller positive integers.
It was proposed by Christian Goldbach that every odd composite number
can be written as the sum of a prime and twice a square.

9 = 7 + 2 * 1^2 <br>
15 = 7 + 2 * 2^2 <br>
21 = 3 + 2 * 3^2 <br>
25 = 7 + 2 * 3^2 <br>
27 = 19 + 2 * 2^2 <br>
33 = 31 + 2 * 1^2 <br>

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as
the sum of a prime and twice a square?

```python
import sympy
import numpy as np

MAXN = int(1e4)

# collect odd composite numbers
rng = np.arange(2, MAXN)
x, y = np.meshgrid(rng, rng)
prod = np.multiply(x, y)
odds = prod[prod%2!=0]
compos = np.unique(odds)

# collect the primes and squares
primes = list(sympy.primerange(0, MAXN))
squares = np.square(np.arange(MAXN))

# find the smallest composite number
# that cannot be written as the sum of a prime and twice a square
x, y = np.meshgrid(primes, 2*squares)
search_arr = np.add(x, y).flatten()

smallest = 0
for n in compos.tolist():
    equalsn = search_arr[search_arr == n]
    if not np.any(equalsn):
        smallest = n
        break

print(smallest)  # 5,777
```
