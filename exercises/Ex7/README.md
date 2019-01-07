## Project Euler Exercise 7

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
that the 6th prime is 13.
What is the 10,001st prime number?

```python
def is_prime(x):
    # will return true if x is prime, false otherwise
    if x == 2 or x == 3:
        return True
    for i in range(2, x):
        if x % i == 0:
            return False
    return True


primes = [2, 3]
while(len(primes) < 10001):
    # add one to your last prime and begin searching from there
    number = primes[-1] + 1
    while not is_prime(number):
        number += 1
    primes.append(number)

print(primes[-1])  # 104,743
```
