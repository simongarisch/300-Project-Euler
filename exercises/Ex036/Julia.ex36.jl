#=
The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)
=#

#println(string(585, base=2))  # 1001001001

function is_both_bases_palindromic(x::Int)::Bool
    # returns true if x is palindromic in base 10 and base 2, false otherwise.
    xstr10::String = string(x)
    xstr2::String = string(x, base=2)
    if xstr10 == reverse(xstr10)
        if xstr2 == reverse(xstr2)
            return true
        end
    end
    return false
end
#println(is_both_bases_palindromic(585))  # true

totsum = 0
for x in 1:convert(Int, 1e6-1)
    if is_both_bases_palindromic(x)
        global totsum
        totsum += x
    end
end

println(totsum)  # 872,187
