'''
The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.

Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:

d2d3d4=406 is divisible by 2
d3d4d5=063 is divisible by 3
d4d5d6=635 is divisible by 5
d5d6d7=357 is divisible by 7
d6d7d8=572 is divisible by 11
d7d8d9=728 is divisible by 13
d8d9d10=289 is divisible by 17
Find the sum of all 0 to 9 pandigital numbers with this property.
'''
import itertools

DIGITS = "0123456789"

def has_property(n):
    # returns True if n has the properties defined for problem, False otherwise
    n = str(n)
    if len(n) != 10:
        return False
    if int(n[1]+n[2]+n[3]) % 2 != 0:
        return False
    if int(n[2]+n[3]+n[4]) % 3 != 0:
        return False
    if int(n[3]+n[4]+n[5]) % 5 != 0:
        return False
    if int(n[4]+n[5]+n[6]) % 7 != 0:
        return False
    if int(n[5]+n[6]+n[7]) % 11 != 0:
        return False
    if int(n[6]+n[7]+n[8]) % 13 != 0:
        return False
    if int(n[7]+n[8]+n[9]) % 17 != 0:
        return False
    return True

#print(has_property(1406357289))  # True

sumpan = 0
x = len(DIGITS)
perms = sorted(list(itertools.permutations(DIGITS, x)), reverse=True)
for perm in perms:
    n = int("".join(perm))
    if has_property(n):
        sumpan += n

print(sumpan)  # 16,695,334,890
