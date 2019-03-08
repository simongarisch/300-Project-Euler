#=
The fraction 49/98 is a curious fraction, as an inexperienced mathematician
in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction,
less than one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
=#

numerators = []
denominators = []
for denominator in 10:99
    # less than one in value, so numerator < denominator
    for numerator in 10:(denominator-1)
        # remove non-trivial examples such as 30/50 = 3/5
        if (numerator % 10) == 0 & (denominator % 10) == 0
            continue
        end
        result = numerator / denominator
        denstr = string(denominator)
        numstr = string(numerator)
        for c in numstr
            if occursin(c, denstr)
                short_num = replace(numstr, c => "", count=1)
                short_den = replace(denstr, c => "", count=1)
                if short_den == "0"
                    # dodge the zero division error
                    continue
                end
                new_result = parse(Float64, short_num) / parse(Float64, short_den)
                if new_result == result
                    push!(numerators, numerator)
                    push!(denominators, denominator)
                    break
                end
            end
        end
    end
end

# we have the four examples
#println(numerators)    # Any[16, 26, 19, 49]
#println(denominators)  # Any[64, 65, 95, 98]
productnum = prod(numerators)
productden = prod(denominators)
minimum_product = min(productnum, productden)
for divisor in minimum_product:-1:2
    global productnum, productden
    if productnum % divisor == 0
        if productden % divisor == 0
            productnum /= divisor
            productden /= divisor
        end
    end
end
println(productden)  # 100
