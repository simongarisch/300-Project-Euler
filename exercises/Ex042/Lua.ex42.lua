--[[
The nth term of the sequence of triangle numbers is given by,
tn = 0.5n(n+1); so the first ten triangle numbers are:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

By converting each letter in a word to a number corresponding to its
alphabetical position and adding these values we form a word value.
For example, the word value for SKY is 19 + 11 + 25 = 55 = t10.
If the word value is a triangle number then we shall call the word a triangle word.

Using words.txt (right click and 'Save Link/Target As...'),
a 16K text file containing nearly two-thousand common English words,
how many are triangle words?
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
tbl[#tbl] = "words.txt"
file_path = table.concat(tbl, "\\")
--print(file_path)

content = read_file(file_path)
content[1] = content[1]:gsub('"', "")
--for k,v in pairs(content) do print(k,v) end
words = {}
for splitk, splitv in pairs(split(content[1], ",")) do
  table.insert(words, splitv)
end
--for k,v in pairs(words) do print(v) end


-- generate some triangle numbers
cumsum = 0
tnums = {}
for i=1,100 do
  cumsum = cumsum + i
  tnums[#tnums+1] = cumsum
end
--for i=1,10 do print(tnums[i]) end

alphabet = string.upper("a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q.r.s.t.u.v.w.x.y.z")
alphabet = split(alphabet, ".")
--for k,v in pairs(alphabet) do print(k,v) end

function get_word_score(word)
  local word_score = 0
  local char
  for i=1, string.len(word) do
    -- get the character for lookup
    char = string.sub(word, i, i)
    -- and search for this in our alphabet table
    for k,v in pairs(alphabet) do
      if v == char then
        word_score = word_score + k
        break
      end
    end
  end
  return word_score
end


function is_triangle_word(word)
  local score = get_word_score(word)
  for k,v in pairs(tnums) do
    if score == v then
      return true
    end
  end
  return false
end


total_words = 0
for k,word in pairs(words) do
  if is_triangle_word(word) then
    total_words = total_words + 1
  end
end

print(total_words)  -- 162
