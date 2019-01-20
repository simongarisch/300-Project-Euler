--[[
Starting at the top left corner of a 2 x 2 grid, and only being able to move
to the right and down, there are exactly 6 routes to the bottom right corner.
How many such routes are there through a 20 x 20 grid?
--]]

function factorial(n)
    if (n == 0) then
        return 1
    else
        return n * factorial(n - 1)
    end
end


function binom (n, k)
  return factorial(n) / (factorial(k) * factorial(n-k))
end

SIZE = 20
choices = binom(2*SIZE, SIZE)

print(choices)  -- 137,846,528,820
