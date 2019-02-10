--[[
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.
--]]

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
--print(file_path)

-- https://github.com/empyreuma/bigint.lua
bigint = dofile(file_path)


sum = 0
num = bigint.new("1")
for i = 1,100 do
  factor = bigint.new(tostring(i))
  num = bigint.multiply(num, factor)
end

numstr = bigint.unserialize(num, "string")
--print(numstr)
for i = 1, #numstr do
    c = numstr:sub(i, i)
    sum = sum + tonumber(c)
end

print(sum)  -- 648
