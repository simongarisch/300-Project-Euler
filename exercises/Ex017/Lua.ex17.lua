--[[
If the numbers 1 to 5 are written out in words=> one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
The use of "and" when writing out numbers is in compliance with British usage.
--]]

num2words = {[1]="One",
             [2]="Two",
             [3]="Three",
             [4]="Four",
             [5]="Five",
             [6]="Six",
             [7]="Seven",
             [8]="Eight",
             [9]="Nine",
             [10]="Ten",
             [11]="Eleven",
             [12]="Twelve",
             [13]="Thirteen",
             [14]="Fourteen",
             [15]="Fifteen",
             [16]="Sixteen",
             [17]="Seventeen",
             [18]="Eighteen",
             [19]="Nineteen",
             [20]="Twenty",
             [30]="Thirty",
             [40]="Forty",
             [50]="Fifty",
             [60]="Sixty",
             [70]="Seventy",
             [80]="Eighty",
             [90]="Ninety"
}
--for k, v in pairs(num2words) do
--  print(k, v)
--end

function get_number_text(num)
  numstr = tostring(num)
  txt = ""
  if string.len(numstr) == 4 then  -- get the thousands
    txt = txt .. num2words[tonumber(string.sub(numstr, 1, 1))]
    txt = txt .. " Thousand "
    numstr = string.sub(numstr, 2, string.len(numstr))
    if numstr == "000" then
      return txt
    end
  end

  if string.len(numstr) == 3 then  -- the hundreds
    txt = txt .. num2words[tonumber(string.sub(numstr, 1, 1))]
    txt = txt .. " Hundred "
    numstr = string.sub(numstr, 2, string.len(numstr))
    if numstr == "00" then
      return txt
    end
  end

  if string.len(txt) > 0 then  -- throw in an 'And '
    txt = txt .. "And "
  end

  if string.len(numstr) == 2 then
    first_digit = tonumber(string.sub(numstr, 1, 1))
    second_digit = tonumber(string.sub(numstr, 2, 2))
    if first_digit > 1 then
      txt = txt .. num2words[first_digit * 10] .. " "
      numstr = string.sub(numstr, 2, string.len(numstr))
    else
      txt = txt .. num2words[tonumber(numstr)]
      numstr = ""
    end
    if second_digit == 0 then
      numstr = ""
    end
  end

  if string.len(numstr) == 1 then
    txt = txt .. num2words[tonumber(numstr)]
  end
  return txt
end


num_chars = 0
for num = 1, 1000 do
  txt = get_number_text(num)
  --print(txt)
  num_chars = num_chars + string.len(string.gsub(txt, "%s+", ""))
end

print(num_chars)  -- 21,124
