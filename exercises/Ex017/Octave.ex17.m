%{
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
The use of "and" when writing out numbers is in compliance with British usage.
%}

mappings =  {"1", "One";
             "2", "Two";
             "3", "Three";
             "4", "Four";
             "5", "Five";
             "6", "Six";
             "7", "Seven";
             "8", "Eight";
             "9", "Nine";
             "10", "Ten";
             "11", "Eleven";
             "12", "Twelve";
             "13", "Thirteen";
             "14", "Fourteen";
             "15", "Fifteen";
             "16", "Sixteen";
             "17", "Seventeen";
             "18", "Eighteen";
             "19", "Nineteen";
             "20", "Twenty";
             "30", "Thirty";
             "40", "Forty";
             "50", "Fifty";
             "60", "Sixty";
             "70", "Seventy";
             "80", "Eighty";
             "90", "Ninety"
};

global num2words = struct();
for i=1:rows(mappings)
  num2words = setfield(num2words, mappings{i,1}, mappings{i,2});
end
#getfield(num2words, "1")


function retval = get_number_text(num)
  # returns the text representing a given integer (up to 1000)
  global num2words;
  numstr = num2str(num);
  txt = "";

  if length(numstr) == 4  # get the thousands
    txt = strcat(txt, getfield(num2words, numstr(1)));
    txt = strcat(txt, "Thousand");
    numstr = substr(numstr, 2, length(numstr)-1);
    if strncmp(numstr, "000", 3)
      retval = strtrim(txt);
      return
    end
  end

  if length(numstr) == 3  # the hundreds
    txt = strcat(txt, getfield(num2words, numstr(1)));
    txt = strcat(txt, "Hundred");
    numstr = substr(numstr, 2, length(numstr)-1);
    if strncmp(numstr, "00", 2)
      retval = strtrim(txt);
      return
    end
  end

  if length(txt) > 0
    txt = strcat(txt, "And");
  end

  if length(numstr) == 2
    first_digit = str2num(numstr(1));
    second_digit = str2num(numstr(2));
    if first_digit > 1
      txt = strcat(txt, getfield(num2words, num2str(first_digit*10)));
      numstr = substr(numstr, 2, length(numstr)-1);
    else
      numstr = num2str(str2num(numstr));  # '01' goes to '1'
      txt = strcat(txt, getfield(num2words, numstr));
      numstr = "";
    end
    if second_digit == 0
      numstr = "";
    end
  end

  if length(numstr) == 1
    txt = strcat(txt, getfield(num2words, numstr));
  end
  retval = txt;
endfunction


#get_number_text(1000)
num_chars = 0;
for num = 1:1000
  txt = get_number_text(num);
  num_chars += length(txt);
end

disp(num_chars)  # 21,124
