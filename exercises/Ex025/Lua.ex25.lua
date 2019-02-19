--[[
The Fibonacci sequence is defined by the recurrence relation:
F(n) = F(n-1) + F(n-2), where F(1) = 1 and F(2) = 1

Hence the first 12 terms will be:

F1 = 1
F2 = 1
F3 = 2
F4 = 3
F5 = 5
F6 = 8
F7 = 13
F8 = 21
F9 = 34
F10 = 55
F11 = 89
F12 = 144
The 12th term, F12, is the first term to contain three digits.

What is the index of the first term in the Fibonacci sequence to contain 1000 digits?
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

bigint = dofile(file_path)

fibindex = 3
fib1 = bigint.new("1")
fib2 = bigint.new("1")
fibvalue = bigint.new("2")

while string.len(bigint.unserialize(fibvalue, "string")) < 1000 do
  fibindex = fibindex + 1
  fib1 = fib2
  fib2 = fibvalue
  fibvalue = bigint.add(fib1, fib2)
end

print(fibindex) -- 4,782
