## Project Euler Exercise 23

A perfect number is a number for which the sum of its proper divisors is
exactly equal to the number.
For example, the sum of the proper divisors of 28 would be
1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n
and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16,
the smallest number that can be written as the sum of two abundant numbers is 24.
By mathematical analysis, it can be shown that all integers greater than 28123
can be written as the sum of two abundant numbers. However, this upper limit cannot
be reduced any further by analysis even though it is known that the greatest number
that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

```python
import itertools
LIMIT = 28123


def get_sum_proper_divisors(x):
    ''' returns the sum of all proper divisors for x '''
    divisors = []
    for i in range(1, int(x/2)+1):
        if x % i == 0:
            divisors.append(i)
    #print(divisors)
    return sum(divisors)

#print(get_sum_proper_divisors(12))  # 16

abundant_numbers = []
for x in range(1, LIMIT+1):
    if get_sum_proper_divisors(x) > x:
        abundant_numbers.append(x)
#print(abundant_numbers)  # [12, 18, 20, 24, ... 28116, 28120, 28122]
#print(len(abundant_numbers))  # 6,965

# get all combinations with replacement for two of these abundent numbers
combinations = itertools.combinations_with_replacement(abundant_numbers, 2)
combinations = sorted(list(set([sum(i) for i in combinations])))
#print("We have %d combinations." % len(combinations))

# We have a list of the abundant numbers we need.
# Find all numbers that cannot be expressed as the sum of two of these.
sumc = 0
for x in range(1, LIMIT+1):
    if x in combinations:
        continue
    else:
        sumc += x

print(sumc)  # 4,179,871
```
