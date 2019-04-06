## Project Euler Exercise 41

We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?

```python
import itertools
import sympy

DIGITS = "123456789"

n = len(DIGITS)
largest = 0

while n >= 1 and largest==0:
    digits = DIGITS[:n]
    perms = sorted(list(itertools.permutations(digits, n)), reverse=True)
    #print("%s: We have %d permutations for n=%d" % (digits, len(perms), n))
    for perm in perms:
        val = int("".join(perm))
        if sympy.isprime(val):
            largest = val
            break
    n -= 1

print(largest)  # 7,652,413
```
