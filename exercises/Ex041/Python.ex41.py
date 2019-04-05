'''
We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?
'''
import sympy

DIGITS = "123456789"
DIGLEN = len(DIGITS)

def ispandigital(n):
    # returns true if n is pandigital, false otherwise
    nstr = "".join(sorted(str(n)))
    nlen = len(nstr)
    if nstr == DIGITS[:nlen]:
        return True
    else:
        return False
#print(ispandigital(2143))  # True


maxp = 0
primes = list(sympy.primerange(2, int(1e10)))
print("We have %d primes" % len(primes))
'''
for prime in sympy.primerange(1, int(1e10)):
    if ispandigital(prime):
        maxp = prime

print(maxp)  #
'''
