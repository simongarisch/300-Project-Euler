## Project Euler Exercise 31

In England the currency is made up of pound and pence, and there are eight coins in general circulation:

1p, 2p, 5p, 10p, 20p, 50p, 1 pound (100p) and 2 pound (200p).
It is possible to make 2 pound in the following way:

1*1 pound + 1*50p + 2*20p + 1*5p + 1*2p + 3*1p
How many different ways can 2 pound be made using any number of coins?

NOTES:
Search between 0-1 two pound coins, 1-2 one pound coins... up to 200 1p coins.
We can look at the cumulative total of value as we add more coins,
subject to a 2 pound value cap.

```python
TARGET_VALUE = 200

count_sum_target = 0  # keep track of the coin combinations that sum to 200p

for v200 in range(0, TARGET_VALUE+1, 200):
    for v100 in range(v200, TARGET_VALUE+1, 100):
        for v50 in range(v100, TARGET_VALUE+1, 50):
            for v20 in range(v50, TARGET_VALUE+1, 20):
                for v10 in range(v20, TARGET_VALUE+1, 10):
                    for v5 in range(v10, TARGET_VALUE+1, 5):
                        for v2 in range(v5, TARGET_VALUE+1, 2):
                            for v1 in range(v2, TARGET_VALUE+1):
                                if v1 == TARGET_VALUE:
                                    count_sum_target += 1


print(count_sum_target)  # 73,682
```
