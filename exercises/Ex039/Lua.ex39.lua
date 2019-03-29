--[[
If p is the perimeter of a right angle triangle with integral length sides, {a,b,c},
there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p <= 1000, is the number of solutions maximised?
--]]

tblperi = {}
for a = 1,1000 do
  for b = (a+1), (1000-a) do
    for c = (b+1), (1000-a-b) do
      if a^2 + b^2 == c^2 then
        perimeter = tostring(a + b + c)
        if tblperi[perimeter] == nil then
          tblperi[perimeter] = 1
        else
          tblperi[perimeter] = tblperi[perimeter] + 1
        end
      end
    end
  end
end

maxp = 0
maxn = 0
for k,v in pairs(tblperi) do
  if v > maxn then
    maxn = v
    maxp = k
  end
end

print(maxp)  -- 840
