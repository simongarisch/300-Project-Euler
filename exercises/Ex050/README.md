## Project Euler Exercise 50

The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?

```python
import sympy

MAXPRIME = int(1e6)

primes = list(sympy.primerange(0, MAXPRIME))
primeslen = len(primes)

primes_cumsum = [0]
for i in range(primeslen):
    primes_cumsum.append(primes_cumsum[-1] + primes[i])

found = False
which_prime = 0
which_len = primeslen

while not found:
    for i in range(primeslen - which_len + 1):
        diff = primes_cumsum[i + which_len] - primes_cumsum[i]
        if diff > MAXPRIME:
            break
        if diff in primes:
            found = True
            which_prime = diff
            break
    if found:
        break
    which_len -= 1

print(which_prime)  # 997,651
```
