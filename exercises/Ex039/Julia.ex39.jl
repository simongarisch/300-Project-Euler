#=
If p is the perimeter of a right angle triangle with integral length sides, {a,b,c},
there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p <= 1000, is the number of solutions maximised?
=#

perimeters = Dict()
for a in 1:1000
    for b in (a+1):(1000-a)
        for c in (b+1):(1000-a-b)
            if a^2 + b^2 == c^2
                perimeter = string(a + b + c)
                if haskey(perimeters, perimeter)
                    perimeters[perimeter] += 1
                else
                    perimeters[perimeter] = 1
                end
            end
        end
    end
end

maxp = 0
maxn = 0
for (k, v) in perimeters
    if v > maxn
        global maxn = v
        global maxp = k
    end
end

println(maxp)  # 840
