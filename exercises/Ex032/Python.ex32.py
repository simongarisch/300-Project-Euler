'''
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once;
for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
'''

def is_pandigital(multiplicand, multiplier, product):
    # returns true is 1 through 9 pandigital, false otherwise
    numbers = str(multiplicand) + str(multiplier) + str(product)
    if len(numbers) != 9:
        return False
    numbers = "".join(sorted(numbers))
    if numbers == "123456789":
        return True
    else:
        return False

#print(is_pandigital(39, 186, 7254))  # True

products = set()
for multiplicand in range(10000):
    for multiplier in range(1000):
        product = multiplicand * multiplier
        if is_pandigital(multiplicand, multiplier, product):
            products.add(product)

print(sum(products))  # 45,228
