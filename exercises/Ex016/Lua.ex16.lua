--[[
2^15= 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?

We'll need to use a bigint lib, so install this from luarocks
luarocks-3.0.4-win32.zip (legacy Windows package, includes Lua 5.1)
Run the install script with install /L to install the interpreter
https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Windows
http://leafo.net/guides/customizing-the-luarocks-tree.html

We can then install a rock in the current directory\lua_modules with
luarocks install --tree lua_modules bigint

--]]
bigint = require("bigint")

function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

sum = 0
base = bigint.new("2")
exp = bigint.new("1000")
num = bigint.exponentiate(base, exp)
numstr = bigint.unserialize(num, "string")
--print(numstr)
for i = 1, #numstr do
    c = numstr:sub(i, i)
    sum = sum + tonumber(c)
end

print(sum)  -- 1,366
