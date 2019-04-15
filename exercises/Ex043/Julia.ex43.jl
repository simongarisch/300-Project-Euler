#=
The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.

Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:

d2d3d4=406 is divisible by 2
d3d4d5=063 is divisible by 3
d4d5d6=635 is divisible by 5
d5d6d7=357 is divisible by 7
d6d7d8=572 is divisible by 11
d7d8d9=728 is divisible by 13
d8d9d10=289 is divisible by 17
Find the sum of all 0 to 9 pandigital numbers with this property.
=#
using Combinatorics

DIGITS = "0123456789"


function has_property(n::Int)::Bool
    nstr::String = string(n)
    if length(nstr) != 10
        return false
    end

    nspl::Array{String} = split(nstr, "")
    if parse(Int, nspl[2] * nspl[3] * nspl[4]) % 2 != 0
        return false
    end
    if parse(Int, nspl[3] * nspl[4] * nspl[5]) % 3 != 0
        return false
    end
    if parse(Int, nspl[4] * nspl[5] * nspl[6]) % 5 != 0
        return false
    end
    if parse(Int, nspl[5] * nspl[6] * nspl[7]) % 7 != 0
        return false
    end
    if parse(Int, nspl[6] * nspl[7] * nspl[8]) % 11 != 0
        return false
    end
    if parse(Int, nspl[7] * nspl[8] * nspl[9]) % 13 != 0
        return false
    end
    if parse(Int, nspl[8] * nspl[9] * nspl[10]) % 17 != 0
        return false
    end
    return true
end


#println(has_property(1406357289))  # true
sumpan = 0
x = length(DIGITS)
perms = [perm for perm in Combinatorics.permutations(DIGITS)]
for perm in perms
    n = parse(Int, join(perm))
    if has_property(n)
        global sumpan += n
    end
end

print(sumpan)  # 16,695,334,890
