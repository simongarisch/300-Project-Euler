'''
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
that the 6th prime is 13.
What is the 10,001st prime number?
'''

def is_prime(x):
    # will return true if x is prime, false otherwise
    if x == 0 or x == 1:
        return False
    if x == 2:
        return True
    for i in range(2, x):
        if x % i == 0:
            return False
    return True


number = counter = 0
while counter < 10001:
    number += 1
    if is_prime(number):
        counter += 1

print(number)  # 104,743
