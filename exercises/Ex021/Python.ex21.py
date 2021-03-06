'''
Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a != b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284.
The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
'''

def sum_divisors(x):
    ''' returns the sum for all divisors of x '''
    sum = 0
    for i in range(1, x):
        if x % i == 0:
            sum += i
    return sum


def is_amicable(x):
    ''' returns true if x is an amicable number, false otherwise '''
    sum_divx = sum_divisors(x)
    if sum_divx == x:
        return False
    if sum_divisors(sum_divx) == x:
        return True
    else:
        return False

#print(is_amicable(220))  # True

sum = 0
for x in range(1, int(1e4)):
    if is_amicable(x):
        sum += x

print(sum)  # 31,626
