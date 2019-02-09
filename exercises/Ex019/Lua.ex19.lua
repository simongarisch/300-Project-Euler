--[[
You are given the following information, but you may prefer to do some research for yourself.

1 Jan 1900 was a Monday.
Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.
A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
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
tbl[#tbl] = "date.lua"
file_path = table.concat(tbl, "\\")
print(file_path)

-- http://tieske.github.io/date/
date = dofile(file_path)

count_sundays = 0
start_date = date("jan 1 1901")
end_date = date("dec 31 2000")

while start_date <= end_date do
  if start_date:getday() == 1 then
    -- getweekday(): The starting day of week (1 for sunday, 2 for monday, ... 7 for saturday).
    if start_date:getweekday() == 1 then
      count_sundays = count_sundays + 1
    end
  end
  start_date:adddays(1)
end

print(count_sundays)  --171
