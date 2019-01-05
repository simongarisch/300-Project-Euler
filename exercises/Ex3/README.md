## Project Euler Exercise 3

The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
See https://www.mathsisfun.com/prime-factorization.html

```python
def is_prime(x):
    # will return true if x is prime, false otherwise
    if x == 2 or x == 3:
        return True
    for i in range(2, x):
        if x % i == 0:
            return False
    return True


largest = None         # the largest prime factor
target = 600851475143  # for a target number

'''
Every composite number has a factor less than or equal
to its square root.
'''
for i in range(2, int(target ** 0.5 + 1)):
    if is_prime(i) and target % i == 0:
        largest = i

print(largest)  # 6,857
```
