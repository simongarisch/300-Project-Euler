#=
A permutation is an ordered arrangement of objects.
For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4.
If all of the permutations are listed numerically or alphabetically,
we call it lexicographic order.
The lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits
0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
=#
using Combinatorics

# https://github.com/JuliaMath/Combinatorics.jl
# permutations(a): Generate all permutations of an indexable object a in lexicographic order.

numstr = [string(i) for i in 0:9]
println(parse(Int64, join(collect(permutations(numstr))[Int(1e6)], "")))  # 2,783,915,460
