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

MAXINT = int(1e7)
curious_numbers = []
for x in range(MAXINT):
    if is_curious(x):
        curious_numbers.append(x)

print(sum(curious_numbers))
