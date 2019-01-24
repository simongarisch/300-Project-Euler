#=
If the numbers 1 to 5 are written out in words=> one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
The use of "and" when writing out numbers is in compliance with British usage.
=#

num2words = Dict("1"=> "One", "2"=> "Two", "3"=> "Three", "4"=> "Four", "5"=> "Five",
                 "6"=> "Six", "7"=> "Seven", "8"=> "Eight", "9"=> "Nine", "10"=> "Ten",
                 "11"=> "Eleven", "12"=> "Twelve", "13"=> "Thirteen", "14"=> "Fourteen",
                 "15"=> "Fifteen", "16"=> "Sixteen", "17"=> "Seventeen", "18"=> "Eighteen",
                 "19"=> "Nineteen", "20"=> "Twenty", "30"=> "Thirty", "40"=> "Forty",
                 "50"=> "Fifty", "60"=> "Sixty", "70"=> "Seventy", "80"=> "Eighty",
                 "90"=> "Ninety")
#println(num2words)

function get_number_text(num)
    # returns the text representing a given integer (up to 1000)
    numstr = string(num)
    txt = ""
    if length(numstr) == 4  # get the thousands
        txt *= num2words[string(numstr[1])]
        txt *= " Thousand "
        numstr = numstr[2:end]
        if numstr == "000"
            return strip(txt)
        end
    end

    if length(numstr) == 3  # the hundreds
        txt *= num2words[string(numstr[1])]
        txt *= " Hundred "
        numstr = numstr[2:end]
        if numstr == "00"
            return strip(txt)
        end
    end

    if length(txt) > 0
        txt *= "And "
    end

    if length(numstr) == 2
        first_digit = parse(Int64,numstr[1])
        second_digit = parse(Int64,numstr[2])
        if first_digit > 1
            txt *= num2words[string(first_digit * 10)] * " "
            numstr = numstr[2:end]
        else
            txt *= num2words[string(parse(Int64,numstr))]
            numstr = ""
        end
        if second_digit == 0
            numstr = ""
        end
    end

    if length(numstr) == 1
        txt *= num2words[numstr]
    end
    return strip(txt)
end


#println(get_number_text(1000))
num_chars = 0
for num in 1: 1000
    global num_chars
    txt = get_number_text(num)
    #println(txt)
    num_chars += length(replace(txt, " " => ""))
end

println(num_chars)  # 21,124
