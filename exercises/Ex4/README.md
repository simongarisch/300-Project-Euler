## Project Euler Exercise 4

A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers is 9009 = 91 * 99.
Find the largest palindrome made from the product of two 3-digit numbers.

```python
def is_palindromic_number(x):
    # returns true if x is a palindromic number, false otherwise
    if str(x) == str(x)[::-1]:
        return True
    else:
        return False


largest = 0
# go through pairs of three digit numbers
# these are all numbers from 100 -> 999
for i in range(100, 1000):
    for j in range(100, 1000):
        result = i * j
        if is_palindromic_number(result):
            if(result > largest):
                largest = result

print(largest)  # 906609
```
