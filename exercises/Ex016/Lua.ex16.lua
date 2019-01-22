--[[
2^15= 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
--]]

--C:\Downloads\ZeroBraneStudio\bin\lua.exe
--print(_VERSION)  -- Lua 5.1
require "bc"

function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

sum = 0
num = 2 ^ 1000
print(num)
numstr = string.format("%f", num)
print(numstr)
--for char in numstr:
--    sum += int(char)

print(sum)  -- 1,366
