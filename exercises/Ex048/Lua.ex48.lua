--[[
The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
--]]
START = 1
STOP = 1000

function split(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local tbl = {}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(tbl, str)
  end
  return tbl
end

exec_file_path = arg[0]  -- path of the current executing file
tbl = split(exec_file_path, "\\")
tbl[#tbl] = "bigint.lua"
file_path = table.concat(tbl, "\\")
print(file_path)

-- https://github.com/empyreuma/bigint.lua
-- bigint can be a bit slow
bigint = dofile(file_path)

current = START
totsum = START
while current < STOP do
  current = current + 1
  base = bigint.new(tostring(current))
  exp = base
  increment = bigint.exponentiate(base, exp)
  incrementstr = bigint.unserialize(increment, "s")
  incrementstr = string.sub(incrementstr, -12)  -- take only the last 12 characters
  totsum = totsum + tonumber(incrementstr)
end

last_ten_digits = string.sub(tostring(totsum), -10)

print(last_ten_digits) -- 
