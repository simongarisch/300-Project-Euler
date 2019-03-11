'''
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
'''
import math

def is_curious(x):
    # returns True if x is equal to the sum its digit factorials, False otherwise
    sumfact = 0
    for digit in str(x):
        sumfact += math.factorial(int(digit))
    #print(x, sumfact)
    if x == sumfact:
        return True
    else:
        return False

#print(is_curious(145))  # True

def get_max_digits():
    digit = 1
    while math.factorial(9) * digit > (digit - 1) ** 10:
        digit += 1
    return digit

digits = get_max_digits()
curious_numbers = []
#  as 1! = 1 and 2! = 2 are not sums they are not included
for x in range(3, digits * 10 ** digits):
    if is_curious(x):
        curious_numbers.append(x)

print(sum(curious_numbers))  # 40,730
