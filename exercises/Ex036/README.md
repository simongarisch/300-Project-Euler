## Project Euler Exercise 36

The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)

```python
#print("{0:b}".format(585))  # 1001001001

def is_both_bases_palindromic(x):
    # returns true if x is palindromic in base 10 and base 2, false otherwise.
    xstr10 = str(x)
    xstr2 = "{0:b}".format(x)
    if xstr10 == xstr10[::-1]:
        if xstr2 == xstr2[::-1]:
            return True
    return False

#print(is_both_bases_palindromic(585))  # True
totsum = 0
for x in range(int(1e6)):
    if is_both_bases_palindromic(x):
        totsum += x

print(totsum)  # 872,187
```
