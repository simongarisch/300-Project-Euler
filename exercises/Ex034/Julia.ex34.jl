#=
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
=#

function is_curious(x::Int)::Bool
    # # returns True if x is equal to the sum its digit factorials, False otherwise
    sumfact = 0
    for digit in split(string(x), "")
        sumfact += factorial(parse(Int, digit))
    end
    if x == sumfact
        return true
    else
        return false
    end
end
#println(is_curious(145))  # true


function get_max_digits()::Int
    digit = 1
    while factorial(9) * digit > (digit - 1) ^ 10
        digit += 1
    end
    return digit
end


digits = get_max_digits()
curious_numbers = []
#  as 1! = 1 and 2! = 2 are not sums they are not included
for x in 3:(10 ** digits)
