#=
The Fibonacci sequence is defined by the recurrence relation:
F(n) = F(n-1) + F(n-2), where F(1) = 1 and F(2) = 1

Hence the first 12 terms will be:

F1 = 1
F2 = 1
F3 = 2
F4 = 3
F5 = 5
F6 = 8
F7 = 13
F8 = 21
F9 = 34
F10 = 55
F11 = 89
F12 = 144
The 12th term, F12, is the first term to contain three digits.

What is the index of the first term in the Fibonacci sequence to contain 1000 digits?
=#

fibindex = 3
fib1 = BigInt(1)
fib2 = BigInt(1)
fibvalue = BigInt(fib1 + fib2)

while length(string(fibvalue)) < 1000
    global fibindex, fib1, fib2, fibvalue
    fibindex += 1
    fib1 = fib2
    fib2 = fibvalue
    fibvalue = fib1 + fib2
end

println(fibindex)  # 4,782
