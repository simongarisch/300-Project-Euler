## Project Euler Exercise 49

The arithmetic sequence, 1487, 4817, 8147,
in which each of the terms increases by 3330, is unusual in two ways:
(i) each of the three terms are prime, and,
(ii) each of the 4-digit numbers are permutations of one another.

There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
exhibiting this property, but there is one other 4-digit increasing sequence.

What 12-digit number do you form by concatenating the three terms in this sequence?

```python
import sympy

START = 1488  # look for the next one
STOP = int(1e4)
INCREMENT = 3330


def ispermutation(a, b):
    return sorted(str(a)) == sorted(str(b))


def primeperms():
    primes = list(sympy.primerange(START, STOP))
    for prime1 in primes:
        for prime2 in filter(lambda x: x > prime1, primes):
            for prime3 in filter(lambda x: x > prime2, primes):
                # check for a constant increment
                if prime1 + INCREMENT  == prime2:
                    if prime2 + INCREMENT == prime3:
                        # and that these are permutations
                        if ispermutation(prime1, prime2):
                            if ispermutation(prime2, prime3):
                                return prime1, prime2, prime3

number = "".join([str(p) for p in primeperms()])
print(number)  # 296,962,999,629
```
