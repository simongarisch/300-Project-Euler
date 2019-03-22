'''
Take the number 192 and multiply it by each of 1, 2, and 3:

192 * 1 = 192
192 * 2 = 384
192 * 3 = 576
By concatenating each product we get the 1 to 9 pandigital, 192384576.
We will call 192384576 the concatenated product of 192 and (1,2,3)

The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5,
giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

What is the largest 1 to 9 pandigital 9-digit number that can be formed as the
concatenated product of an integer with (1,2, ... , n) where n > 1?

NOTES:
n > 1, so n must be at least 2.
Consider products after they are sorted in descending order.
if n == 2 then the largest possible products could be 98765, 4321
if n == 3 then the largest possible products could be 987, 645, 321
Search in the range 1 -> (9/n + 1 first digits of 987654321)
when hunting for pandigital numbers with a given level of n.
'''

DIGITS = "987654321"

for n in range(2, 10):
    numlen = int(9/n+1)
    stopat = int(DIGITS[:numlen])
    #print(n, stopat)
    for i in range(stopat):
        pass
