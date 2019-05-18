--[[
The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
--]]
START = 1
STOP = 1000

function powerof(n)
  -- fetch the last digits from the result n^n
  result = n
  for i=2,n do
    result = result * n
    -- only keep the last digits
    result = result % 1e12
  end
  return result
end


totsum = 0
for i = START,STOP do
  totsum = totsum + powerof(i)
end
totsum = string.sub(string.format("%.0f",totsum), -10)

print(totsum)  -- 9,110,846,700
