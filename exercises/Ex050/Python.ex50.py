'''
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
'''
import sympy

MAXPRIME = int(1e3)

# collect primes from largest to smallest
primes = list(sympy.primerange(0, MAXPRIME))
primeslen = len(primes)

primes_cumsum = [primes[0]]
for i in range(1, primeslen):
    primes_cumsum.append(primes_cumsum[i-1] + primes[i])

found = False
which_prime = 0
which_len = primeslen - 1

while not found:
    for i in range(primeslen - which_len):
        diff = primes_cumsum[i+which_len] - primes_cumsum[i]
        if diff in primes:
            found = True
            which_prime = diff
            break

print(which_prime, which_len)
