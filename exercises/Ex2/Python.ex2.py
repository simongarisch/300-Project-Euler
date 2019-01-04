'''
Each new term in the Fibonacci sequence is generated by adding the previous two terms.
By starting with 1 and 2, the first 10 terms will be:
1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
By considering the terms in the Fibonacci sequence whose values do not exceed four million,
find the sum of the even-valued terms.
'''

fib = [1, 2]
sum = 2  # only sum even valued terms

while True:
    next_value = fib[-1] + fib[-2]
    fib.append(next_value)
    if next_value < 4000000:
        if next_value % 2 == 0:  # only sum even valued terms
            sum += next_value
    else:
        break

print(sum)  # 4,613,732
