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
