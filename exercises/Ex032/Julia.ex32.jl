#=
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once;
for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
=#

function is_pandigital(multiplicand::Int, multiplier::Int, product::Int)::Bool
    numbers = string(multiplicand) * string(multiplier) * string(product)
    if length(numbers) != 9
        return false
    end
    numbers = join(sort(split(numbers,"")))
    if numbers == "123456789"
        return true
    else
        return false
    end
end
#println(is_pandigital(39, 186, 7254))  # true

products = Set()
for multiplicand in 1:10000
    for multiplier in 1:100
        product = multiplicand * multiplier
        if is_pandigital(multiplicand, multiplier, product)
            push!(products, product)
        end
    end
end

println(sum(products))  # 45,228
