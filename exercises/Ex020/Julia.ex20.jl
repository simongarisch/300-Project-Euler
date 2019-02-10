#=
n! means n * (n - 1) * ... * 3 * 2 * 1

For example, 10! = 10 * 9 * ... * 3 * 2 * 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
=#

sum = 0
num = BigInt(1)
for i in 1:100
    global num
    num *= i
end

numstr = string(num)
for char in split(numstr, "")
    global sum
    sum += parse(Int64, char)
end

println(sum)  # 648
