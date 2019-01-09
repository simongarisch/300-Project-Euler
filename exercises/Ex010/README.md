## Project Euler Exercise 10

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.

```python
def is_prime(x):
    # will return true if x is prime, false otherwise
    if x == 0 or x == 1:
        return False
    if x == 2:
        return True
    for i in range(2, int(x ** 0.5)+1):
        if x % i == 0:
            return False
    return True


sum = 0
for i in range(2000000):
    if is_prime(i):
        sum += i

print(sum)  # 142,913,828,922
```
