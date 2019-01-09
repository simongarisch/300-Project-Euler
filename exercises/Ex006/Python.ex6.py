
sum = 0
sum_of_squares = 0

for i in range(101):
    sum += i
    sum_of_squares += i ** 2

square_of_sum = sum ** 2

print(square_of_sum - sum_of_squares)  # 25,164,150
