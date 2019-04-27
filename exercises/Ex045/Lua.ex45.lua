--[[
Triangle, pentagonal, and hexagonal numbers are generated by the following formulae:

Triangle	 	Tn=n(n+1)/2	 	1, 3, 6, 10, 15, ...
Pentagonal	 	Pn=n(3n-1)/2	1, 5, 12, 22, 35, ...
Hexagonal	 	Hn=n(2n-1)	 	1, 6, 15, 28, 45, ...

It can be verified that T285 = P165 = H143 = 40755.

Find the next triangle number that is also pentagonal and hexagonal.
--]]

MAXN = 1e5
FIND_AFTER = 40755

function triangle(n) return n*(n+1)/2 end
function pentagonal(n) return n*(3*n-1)/2 end
function hexagonal(n) return n*(2*n-1) end

function populate(func)
  local tbl = {}
  local n = 0
  while n <= MAXN do
    n = n + 1
    tbl[n] = func(n)
  end
  return tbl
end


tn = populate(triangle);
pn = populate(pentagonal);
hn = populate(hexagonal);

local function has_value(tbl, val)
  for k,v in pairs(tbl) do
    if v == val then
      return true
    end
  end
  return false
end

result = 0
for i=1,#hn do
  h = hn[i]
  if(has_value(pn, h)) then
    if(has_value(tn, h)) then
      if h > FIND_AFTER then
        result = h
        break
      end
    end
  end
end

print(result)  -- 1,533,776,805
