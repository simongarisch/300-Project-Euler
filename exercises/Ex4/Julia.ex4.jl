#=
A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers is 9009 = 91 * 99.
Find the largest palindrome made from the product of two 3-digit numbers.
=#

function is_palindromic_number(x)
  # returns true if x is a palindromic number, false otherwise
  strx = string(x)
  if strx == reverse(strx)
      return true
  else
      return false
  end
end


largest = 0;
# go through pairs of three digit numbers
# these are all numbers from 100 -> 999
for i in 100:999
    for j in 100:999
        result = i * j
        global largest
        if is_palindromic_number(result)
            if result > largest
                largest = result
            end
        end
    end
end

println(largest)  # 906609
