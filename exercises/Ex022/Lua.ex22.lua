--[[
Using names.txt (right click and 'Save Link/Target As...'),
a 46K text file containing over five-thousand first names,
begin by sorting it into alphabetical order.

Then working out the alphabetical value for each name,
multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order,
COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list.
So, COLIN would obtain a score of 938 * 53 = 49714.

What is the total of all the name scores in the file?
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
tbl[#tbl] = "names.txt"
file_path = table.concat(tbl, "\\")
--print(file_path)

names = split(read_file(file_path)[1]:gsub('"', ""), ",")
table.sort(names)
--for k,v in pairs(names) do print(k,v) end

alphabet = string.upper("a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q.r.s.t.u.v.w.x.y.z")
alphabet = split(alphabet, ".")
--for k,v in pairs(alphabet) do print(k,v) end

function get_name_score(name)
  local name_score = 0
  local char
  for i=1, string.len(name) do
    -- get the character for lookup
    char = string.sub(name, i, i)
    -- and search for this in our alphabet table
    for k,v in pairs(alphabet) do
      if v == char then
        name_score = name_score + k
        break
      end
    end
  end
  return name_score
end
--print(get_name_score("COLIN"))  -- 53

total_score = 0
for key,name in pairs(names) do
  name_score = get_name_score(name)
  total_score = total_score + (key * name_score)
end
print(total_score)  -- 871,198,282
