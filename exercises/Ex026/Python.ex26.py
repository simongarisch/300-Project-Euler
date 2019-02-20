'''
A unit fraction contains 1 in the numerator.
The decimal representation of the unit fractions with denominators 2 to 10 are given:

1/2	= 	0.5
1/3	= 	0.(3)
1/4	= 	0.25
1/5	= 	0.2
1/6	= 	0.1(6)
1/7	= 	0.(142857)
1/8	= 	0.125
1/9	= 	0.(1)
1/10	= 	0.1
Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle.
It can be seen that 1/7 has a 6-digit recurring cycle.

Find the value of d < 1000 for which 1/d contains the longest
recurring cycle in its decimal fraction part.

NOTES:
We'll approach this dividing by some int and keeping track of the result, remainder
and significant figure we're working with.
If we divide my a int (i) then the maximum number of potential remainders we can have is (i-1)
For example, if we have x / 12, possible remainders (if there are any) include
1, 2, 3, ... 11.
If we find the same remainder again them the pattern will repeat.
'''

longest_pattern = 0   # the longest recurring cycle
longest_divisor = 0   # for a particular divisor

for i in range(2, 1000):
    n = 1        # numerator to be divided by
    result = []  # track the result of our division

    # the maximum number of potential remainders we can have is (i-1)
    remainders_found = {k: False for k in range(1, i)}
    pattern_length = 0
    pattern_found = False

    while(n != 0):
        n *= 10         # go to the next significant figure
        wholes = n / i  # get the number of times n is evenly divisible by i
        n = n % i       # continue with division for the remainder
        result.append(wholes)
        if n == 0:
            break

        # check if we have seen this remainder before
        if remainders_found[n]:
            if not pattern_found:
                idx1 = result.index(wholes)
                idx2 = len(result)
                pattern_length = idx2 - idx1 - 1
                if pattern_length == 0:
                    tcount = len([v for v in list(remainders_found.values()) if v is True])
                    if tcount == 1:
                        pattern_length = 1
                if pattern_length > longest_pattern:
                    longest_pattern = pattern_length
                    longest_divisor = i
                pattern_found = True

        remainders_found[n] = True
        if pattern_found and len(result) > 15:
            break

    #decimal = "%0.15f" % float("0." + "".join([str(x) for x in result]))
    #print(str(i) + "\t" + str(decimal) + "\t" + str(pattern_length))

print(longest_divisor)  # 983
