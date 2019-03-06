## Project Euler Exercise 33

The fraction 49/98 is a curious fraction, as an inexperienced mathematician
in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction,
less than one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.

```python
examples = []
for denominator in range(10,100):
    # less than one in value, so numerator < denominator
    for numerator in range(10,denominator):
        # remove non-trivial examples such as 30/50 = 3/5
        if (numerator % 10) == 0 and (denominator % 10 == 0):
            continue
        result = numerator / float(denominator)
        denstr = str(denominator)
        numstr = str(numerator)
        for c in numstr:
            if c in denstr:
                #print(numstr, denstr)
                # only replace one character in each
                short_num = numstr.replace(c, "", 1)
                short_den = denstr.replace(c, "", 1)
                if short_den == "0":
                    # dodge the zero division error
                    continue
                #print(short_num, short_den)
                new_result = float(short_num) / float(short_den)
                if new_result == result:
                    examples.append((numerator, denominator))
                    break

# we have the four examples
#print(examples)  # [(16, 64), (26, 65), (19, 95), (49, 98)]
productnum = 1
productden = 1
for pair in examples:
    productnum *= pair[0]
    productden *= pair[1]
#print(productnum, productden)  # (387296, 38729600)

no_common_divisors = False
while not no_common_divisors:
    minimum_product = min(productnum, productden)
    for divisor in range(2, minimum_product+1):
        if productnum % divisor == 0:
            if productden % divisor == 0:
                productnum /= divisor
                productden /= divisor
                break
        if divisor == minimum_product:
            no_common_divisors = True
    if productnum == 1:
        no_common_divisors = True

print(productden)  # 100
```
