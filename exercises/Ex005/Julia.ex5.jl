#=
2520 is the smallest number that can be divided by each of the numbers
from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of
the numbers from 1 to 20?
=#

function is_divisible_to_20(x)
  # returns true if x is evenly divisible by all of the
  # numbers from 1 to 20, false otherwise.
  for i in 1:20
    if x % i != 0
      return false
    end
  end
  return true
end


counter = 1
while !is_divisible_to_20(counter)
  global counter
  counter += 1
end

println(counter)  # 232,792,560
