#=
Take the number 192 and multiply it by each of 1, 2, and 3:

192 * 1 = 192
192 * 2 = 384
192 * 3 = 576
By concatenating each product we get the 1 to 9 pandigital, 192384576.
We will call 192384576 the concatenated product of 192 and (1,2,3)

The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5,
giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

What is the largest 1 to 9 pandigital 9-digit number that can be formed as the
concatenated product of an integer with (1,2, ... , n) where n > 1?
=#

function pandigital(x::Int, n::Int)::BigInt
    # returns pandigital value if ispandigital
    # 0 otherwise
    results::Vector{String} = []
    for i::Int in 1:n
        push!(results, string(x * i))
    end
    pnum::BigInt = parse(BigInt, join(results, ""))
    concat::String = join(sort(split(string(pnum),"")))
    if concat == "123456789"
        return pnum
    else
        return 0
    end
end
#println(pandigital(192, 3))  # 192384576


function maxpandigitaln(x::Int)::BigInt
    # check if x is pandigital for any value of n
    # where n > 1
    # because we are doing a concat, n < 10
    pan::BigInt = 0
    for n::Int in 2:11
        pan = max(pan, pandigital(x, n))
    end
    return pan
end
#println(maxpandigitaln(192))  # 192384576


x = 98765
maxpan = 0
while x > 0
    global maxpan, x
    maxpan = max(maxpan, maxpandigitaln(x))
    x -= 1
end

println(maxpan)  # 932,718,654
