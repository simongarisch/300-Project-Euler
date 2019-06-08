## Project Euler Exercise 51

By replacing the 1st digit of the 2-digit number *3,
it turns out that six of the nine possible values: 13, 23, 43, 53, 73, and 83,
are all prime.

By replacing the 3rd and 4th digits of 56**3 with the same digit,
this 5-digit number is the first example having seven primes among the ten
generated numbers, yielding the family:
56003, 56113, 56333, 56443, 56663, 56773, and 56993.
Consequently 56003, being the first member of this family,
is the smallest prime with this property.

Find the smallest prime which, by replacing part of the number
(not necessarily adjacent digits) with the same digit,
is part of an eight prime value family.

```python
import itertools
from bisect import bisect_left
from collections import Counter
import sympy

START = 1
STOP = int(1e6)
TARGET_PRIMES = 7
DIGITS = "0123456789"


def collect_primes(start, stop):
    # collect all prime numbers within some range
    return list(sympy.primerange(start, stop))
#print(collect_primes(0, 20))  # [2, 3, 5, 7, 11, 13, 17, 19]


def collect_digit_replacements(ndigits):
    # we'll have to replace certain digits with a *
    # get combinations of digits we'll need to replace
    combs = []
    for i in range(1, ndigits):
        combs.extend(list(itertools.combinations(range(ndigits), i)))
    return combs
#print(collect_digit_replacements(2))  # [(0,), (1,)]
#print(collect_digit_replacements(3))  # [(0,), (1,), (2,), (0, 1), (0, 2), (1, 2)]


def filter_ndigit(primes_list, n):
    # return only numbers in the list with n digits
    # also return numbers with combinations of * inserted
    primes_filtered = [prime for prime in primes_list if len(str(prime)) == n]
    primes_strings = [str(prime) for prime in primes_filtered]
    replacements = collect_digit_replacements(n)

    stars = []
    for index, prime in enumerate(primes_strings):
        for replacement in replacements:
            plist = list(prime)
            for index in replacement:
                plist[index] = "*"
            stars.append("".join(plist))
    return primes_filtered, stars
#primes_list = collect_primes(0, int(1e2))
#primes_filtered, stars = filter_ndigit(primes_list, 2)
#print(primes_filtered)  # [11, 13, 17, 19, 23, 29, 31, 37, 41 ...
#print(stars)            # ['*1', '1*', '*3', '1*', '*7', '1*', ...


def find_elem(elem, sorted_list):
    # https://docs.python.org/3/library/bisect.html
    i = bisect_left(sorted_list, elem)
    if i != len(sorted_list) and sorted_list[i] == elem:
        return True
    return False
#print(find_elem(5, list(range(10))))  # True


def ndigit_family(primes_list, n, target_primes):
    # check for unique pattern groups with n or more digits
    primes_filtered, stars = filter_ndigit(primes_list, n)
    counter = Counter(stars)
    counter = {k:v for k,v in counter.iteritems() if v >= target_primes}
    min_all = []  # the minimum prime from all groups
    for key in counter.keys():
        count_primes = 0
        primes = []
        for digit in DIGITS:
            value = int(key.replace("*", digit))
            if len(str(value)) == n:
                if find_elem(value, primes_filtered):
                    count_primes += 1
                    primes.append(value)
        if count_primes == target_primes:
            min_all.append(min(primes))
    return min(min_all) if len(min_all) > 0 else None
#print(ndigit_family(collect_primes(0, int(1e3)), 2, 6))  # 13
#print(ndigit_family(collect_primes(0, int(1e6)), 5, 7))  # 56003


primes_list = collect_primes(START, STOP)

ndigits = 1
result = None
while result is None:
    ndigits += 1
    result = ndigit_family(primes_list, ndigits, 8)

print(result)  # 121,313
```
