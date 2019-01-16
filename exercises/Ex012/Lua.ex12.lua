--[[
The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

Let us list the factors of the first seven triangle numbers:

 1: 1
 3: 1,3
 6: 1,2,3,6
10: 1,2,5,10
15: 1,3,5,15
21: 1,3,7,21
28: 1,2,4,7,14,28
We can see that 28 is the first triangle number to have over five divisors.

What is the value of the first triangle number to have over five hundred divisors?
--]]

TARGET_FACTORS = 500

triangle_number = 1
num_factors = 1
counter = 1

while num_factors < TARGET_FACTORS do
    counter = counter + 1
    triangle_number = triangle_number + counter
    num_factors = 2  -- divisible by itself and one
    for i = 2, math.floor(triangle_number ^ 0.5 + 1) do
        if triangle_number % i == 0 then
            if i ^ 2 == triangle_number then
                num_factors = num_factors + 1
            else
                num_factors = num_factors + 2
            end
        end
    end
end

print(triangle_number)  -- 76,576,500