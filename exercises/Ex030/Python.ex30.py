'''
Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 1^4 + 6^4 + 3^4 + 4^4
8208 = 8^4 + 2^4 + 0^4 + 8^4
9474 = 9^4 + 4^4 + 7^4 + 4^4
As 1 = 1^4 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
'''
import itertools

POWER = 4

search_range = list(range(10))
combs = []
for comb in itertools.product(search_range, repeat=POWER):
    comb_str = "".join([str(x) for x in comb])
    comb_num = int(comb_str)
    combs.append(comb_str)


def digit_powers_equal(numstr, power):
    # returns true if the sum of numstr digits to some power equal our numstr
    pow_sum = str(sum([int(x)**power for x in numstr]))
    return pow_sum == numstr
#print(digit_powers_equal("1634", POWER))  # True


total = 0
for comb in combs:
    if digit_powers_equal(comb, POWER):
        #print(comb)
        total += int(comb)

print(total)  #
