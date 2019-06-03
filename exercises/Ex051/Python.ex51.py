'''
By replacing the 1st digit of the 2-digit number *3,
it turns out that six of the nine possible values: 13, 23, 43, 53, 73, and 83,
are all prime.

By replacing the 3rd and 4th digits of 56**3 with the same digit,
this 5-digit number is the first example having seven primes among the ten
generated numbers, yielding the family:
56003, 56113, 56333, 56443, 56663, 56773, and 56993.
Consequently 56003, being the first member of this family,
is the smallest prime with this property.

Find the smallest prime which, by replacing part of the number
(not necessarily adjacent digits) with the same digit,
is part of an eight prime value family.
'''
import sympy

START = 10
STOP = int(1e2)
DIGITS = "0123456789"
TARGET_PRIMES = 6


primes = list(sympy.primerange(START, STOP))

def primes_in_family(family="*3"):
    global primes, DIGITS
    counter = 0
    first = None
    for digit in DIGITS:
        n = int(family.replace("*", digit))
        if n in primes:
            if counter == 0:
                first = n
            counter += 1
    return counter, first
#print(primes_in_family())  # (6, 13)


start = START
checked = []  # all the numbers we have checked
found = False

while not found:
    numstr = str(start)
    for digit in numstr:
        # we need to replace one or more digits with an *
        family = numstr.replace(digit, "*")
        if family not in checked:
            checked.append(family)
            counter, first = primes_in_family(family)
            if counter == TARGET_PRIMES:
                found = True
                break

    if found:
        break
    start += 1
    if start >= STOP:
        break

print(first)
