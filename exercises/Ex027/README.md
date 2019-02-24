## Project Euler Exercise 27

Euler discovered the remarkable quadratic formula:

n^2+n+41
It turns out that the formula will produce 40 primes for the consecutive integer values 0≤n≤39. However, when n=40,402+40+41=40(40+1)+41 is divisible by 41, and certainly when n=41,412+41+41 is clearly divisible by 41.

The incredible formula n^2−79n+1601 was discovered, which produces 80 primes for the consecutive values 0≤n≤79. The product of the coefficients, −79 and 1601, is −126479.

Considering quadratics of the form:

n^2+an+b, where |a|<1000 and |b|≤1000

where |n| is the modulus/absolute value of n
e.g. |11|=11 and |−4|=4
Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n=0.

```python
import sympy


def quadratic_formula(n, a, b):
    ''' returns the result of n^2 + a*n + b '''
    return n**2 + a*n + b


# where |a| < 1000 and |b| leq 1000
asearch_range = range(-999, 1000)
bsearch_range = range(-1000, 1001)
#print(len(asearch_range), len(bsearch_range))  # 1999, 2001

primesdict = dict()  # cache prime calculation results
maxprimes = 0
product = 0

for a in asearch_range:
    for b in bsearch_range:
        n = 0
        isprime = True
        while isprime:
            qfresult = quadratic_formula(n, a, b)
            isprime = primesdict.get(qfresult)
            if isprime is None:
                isprime = sympy.isprime(qfresult)
                primesdict[qfresult] = isprime
            if isprime:
                n += 1
                if n > maxprimes:
                    maxprimes = n
                    product = a * b

print(product)  # -59,231
```
