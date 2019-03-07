#=
The fraction 49/98 is a curious fraction, as an inexperienced mathematician
in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction,
less than one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
=#

examples = []
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
        for c in numstr do
            if occursin(c, denstr)
                short_num = numstr.replace(c, "", 1)
            end
        end
    end
end
