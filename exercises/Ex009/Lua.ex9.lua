--[[
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a^2 + b^2 = c^2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
--]]

product = nothing

for a = 1,1000 do
    for b = (a+1),1000 do
        for c = (b+1),1000 do
            if (a+b+c == 1000) and (a^2 + b^2 == c^2) then
                product = a * b * c
                break
            end
        end
    end
end

print(product)  -- 31,875,000
