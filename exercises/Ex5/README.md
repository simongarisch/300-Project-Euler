## Project Euler Exercise 5

2520 is the smallest number that can be divided by each of the numbers
from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of
the numbers from 1 to 20?

```python
def is_divisible_to_20(x):
    # returns true if x is evenly divisible by all of the
    # numbers from 1 to 20, false otherwise.
    for i in range(1, 21):
        if x % i != 0:
            return False
    return True


counter = 1
while not is_divisible_to_20(counter):
    counter += 1

print(counter)  # 232,792,560
```
