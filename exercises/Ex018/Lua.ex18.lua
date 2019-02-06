--[[
By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

3
7 4
2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom of the triangle below:

75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23

NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route.
However, Problem 67, is the same challenge with a triangle containing one-hundred rows;
it cannot be solved by brute force, and requires a clever method! ;o)
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


function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end


function read_file(file)
  if not file_exists(file) then return {} end
  lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

exec_file_path = arg[0]  -- path of the current executing file
tbl = split(exec_file_path, "\\")
tbl[#tbl] = "triangle.txt"
file_path = table.concat(tbl, "\\")
--print(file_path)

content = read_file(file_path)
--for k,v in pairs(content) do print(k,v) end
for k,v in pairs(content) do
  tmp = {}
  for splitk, splitv in pairs(split(v, " ")) do
    table.insert(tmp, tonumber(splitv))
  end
  content[k] = tmp
end
--[[
for key,tbl in pairs(content) do
  for k,v in pairs(tbl) do
    io.write(v .. " ")
  end
  print("")
end
--]]

-- move up the triangle to calculate maximums
for irow = (#content-1),1,-1 do
  row = content[irow]
  nextrow = content[irow+1]
  for key,value in pairs(row) do
    godown = value + nextrow[key]
    goright = value + nextrow[key+1]
    content[irow][key] = math.max(godown, goright)
  end
end

print(content[1][1])  -- 1,074
