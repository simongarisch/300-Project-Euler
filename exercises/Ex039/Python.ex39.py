'''
If p is the perimeter of a right angle triangle with integral length sides, {a,b,c},
there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p <= 1000, is the number of solutions maximised?
'''
from collections import defaultdict


# An integer triangle or integral triangle is a triangle all of whose
# sides have lengths that are integers.
# Right angled triangles must satisfy a^2 + b^2 == c^2
# Looks like they are also looking where a < b < c
perimeters = defaultdict(lambda: 0)
# if p = 1000, then each side must be < 1000
for a in range(1, 1000):
    for b in range(a+1, 1000-a):
        for c in range(b+1, 1000-a-b):
            # check is a right angled triangle
            if a**2 + b**2 == c**2:
                perimeter = a + b + c
                perimeters[perimeter] += 1

#print(perimeters)
maxp = 0  # the perimeter value
maxn = 0  # that has the maximum number of solutions
for k,v in perimeters.items():
    if v > maxn:
        maxn = v
        maxp = k

print(maxp)  # 840
