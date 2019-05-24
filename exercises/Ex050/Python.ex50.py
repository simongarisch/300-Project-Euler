'''
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
'''
import sympy

MAXPRIME = int(1e6)


# collect primes from largest to smallest
primes = list(reversed(list(sympy.primerange(0, MAXPRIME))))
numprimes = len(primes)
maxcounter, maxprime = 0, 0

for i in range(numprimes):
    prime = primes[i]
    start = i
    for j in range(start+1, numprimes):
        counter = 0
        totsum = 0
        while totsum < prime:
            if j + counter >= numprimes:
                break
            totsum += primes[j+counter]
            counter += 1
        if totsum == prime:
            if counter > maxcounter:
                maxcounter = counter
                maxprime = prime

print(maxprime)
