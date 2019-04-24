#=
Triangle, pentagonal, and hexagonal numbers are generated by the following formulae:

Triangle	 	Tn=n(n+1)/2	 	1, 3, 6, 10, 15, ...
Pentagonal	 	Pn=n(3n-1)/2	1, 5, 12, 22, 35, ...
Hexagonal	 	Hn=n(2n-1)	 	1, 6, 15, 28, 45, ...

It can be verified that T285 = P165 = H143 = 40755.

Find the next triangle number that is also pentagonal and hexagonal.
=#

MAXN = 1e5
FIND_AFTER = 40755

triangle(n::Int)::Int = n*(n+1)/2
pentagonal(n::Int)::Int = n*(3*n-1)/2
hexagonal(n::Int)::Int = n*(2*n-1)

function populate(func)::Array{Int}
    listn::Array{Int} = []
    n::Int = 0
    while n <= MAXN
        n += 1
        push!(listn, func(n))
    end
    return listn
end

tn = populate(triangle)
pn = populate(pentagonal)
hn = populate(hexagonal)

result = 0
for h in hn
    if h in pn
        if h in tn
            if h > FIND_AFTER
                global result = h
                break
            end
        end
    end
end

println(result)  # 1,533,776,805
