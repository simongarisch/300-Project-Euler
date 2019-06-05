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

import itertools
import sympy

START = 1
STOP = int(1e3)
TARGET_PRIMES = 6


primes = list(sympy.primerange(START, STOP))
strprimes = [str(prime) for prime in primes]

# get the indices we need to replace with * in our search
replacements_dict = {}
for n in range(2, len(str(STOP))):
    combs = []
    for i in range(1, min(n, 3)):
        combs.extend(list(itertools.combinations(range(n), i)))
    replacements_dict[n] = combs
#print(replacements_dict[2])  # [(0,), (1,)]
#print(replacements_dict[3])  # [(0,), (1,), (2,), (0, 1), (0, 2), (1, 2)]

# start with two digits and work our way up
found = False
ndigits = 1
while not found:
    ndigits += 1
    strprimes_filtered = []
    for strprime in strprimes:
        if len(strprime) <= ndigits:
            if len(strprime) == ndigits:
                strprimes_filtered.append(strprime)
        else:
            break

    replacements = replacements_dict[ndigits]
    filtered_copy = strprimes_filtered[:]
    for replacement in replacements:
        for index, prime in enumerate(filtered_copy):
            prime_list = list(prime)
            for index in replacement:
                prime_list[index] = "*"
            filtered_copy[index] = "".join(prime_list)
            print(filtered_copy[index])
    found = True

'''
import itertools
import sympy

START = int(56e3)
STOP = int(1e6)
DIGITS = "0123456789"
DIGITS_EX0 = "123456789"
TARGET_PRIMES = 7


primes = list(sympy.primerange(START, STOP))


def primes_in_family(family="*3"):
    global primes, DIGITS
    counter = 0
    first = None
    if family[0] == "*":
        digits = DIGITS_EX0
    else:
        digits = DIGITS

    for digit in digits:
        n = int(family.replace("*", digit))
        if n in primes:
            if counter == 0:
                first = n
            counter += 1
    return counter, first
#print(primes_in_family())  # (6, 13)


replacements_dict = {}
def replace_index(n):
    # get the indices of digits to replace
    # only look to replace 1-2 digits at this stage
    global replacements_dict
    nlen = len(str(n))
    replacements = replacements_dict.get(nlen)
    if replacements is not None:
        return replacements

    rep1 = list(itertools.combinations(range(nlen), 1))
    rep2 = []
    if nlen > 2:
        rep2 = list(itertools.combinations(range(nlen), 2))
    rep1.extend(rep2)

    replacements = rep1[:]
    replacements_dict[nlen] = replacements
    return replacements
#print(replace_index(222))  # [(0,), (1,), (2,), (0, 1), (0, 2), (1, 2)]


num_primes = len(primes)
primes_index = 0  # start checking from the first prime
checked = []      # all the numbers we have checked
found = False

while not found and primes_index < num_primes:
    numstr = str(primes[primes_index])
    replacements = replace_index(numstr)
    for replacement in replacements:
        family = [i for i in numstr]
        for index in replacement:
            family[index] = "*"
        family = "".join(family)
        if family not in checked:
            checked.append(family)
            counter, first = primes_in_family(family)
            if counter == TARGET_PRIMES:
                print(family)
                found = True
                break

    if found:
        break
    else:
        first = 0
    primes_index += 1

print(first)
'''
