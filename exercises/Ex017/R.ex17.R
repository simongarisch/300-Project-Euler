
# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
#
#
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
# The use of "and" when writing out numbers is in compliance with British usage.

numbers <- c(
  1, 2, 3, 4, 5,
  6, 7, 8, 9, 10,
  11, 12, 13, 14, 15,
  16, 17, 18, 19, 20,
  30, 40, 50, 60, 70, 80, 90
)

numnames <- c(
  "One", "Two", "Three", "Four", "Five",
  "Six", "Seven", "Eight", "Nine", "Ten",
  "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen",
  "Sixteen", "Seventeen", "Eighteen", "Nineteen", "Twenty",
  "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"
)

num2words <- as.list(numnames)
names(num2words) <- numbers

#print(num2words)
#print(num2words["90"][[1]])
#print(nchar(num2words["90"][[1]]))


get_number_text <- function(num){
  # returns the text representing a given integer (up to 1000)
  numstr <- as.character(num)
  txt = ""
  if(nchar(numstr) == 4){  # get the thousands
    first_char <- substr(numstr, 1, 1)
    txt <- paste0(txt, num2words[first_char][[1]], " Thousand ")
    numstr <- substr(numstr, 2, nchar(numstr))
    if(numstr == "000"){
      return(trimws(txt))
    }
  }

  if(nchar(numstr) == 3){  # the hundreds
    first_char <- substr(numstr, 1, 1)
    txt <- paste0(txt, num2words[first_char][[1]], " Hundred ")
    numstr <- substr(numstr, 2, nchar(numstr))
    if(numstr == "00"){
      return(trimws(txt))
    }
  }

  if(nchar(txt) > 0){  # throw in an 'And '
    txt <- paste0(txt, "And ")
  }

  if(substr(numstr, 1, 1) == "0"){
    numstr <- substr(numstr, 2, nchar(numstr))
  }

  if(nchar(numstr) == 2){
    first_digit <- as.integer(as.numeric(substr(numstr, 1, 2)) / 10)
    second_digit <- as.integer(as.numeric(substr(numstr, 2, 2)))
    if(first_digit > 1){
      txt <- paste0(txt, num2words[as.character(first_digit * 10)][[1]], " ")
      numstr <- substr(numstr, 2, nchar(numstr))
    }else{
      txt <- paste0(txt, num2words[numstr][[1]])
      numstr <- ""
    }
    if(second_digit == 0){
      numstr <- ""
    }
  }

  if(nchar(numstr) == 1){
    txt <- paste0(txt, num2words[numstr][[1]])
  }
  return(trimws(txt))
}


charcount <- 0
for(num in 1:1000){
  txt <- get_number_text(num)
  # don't count whitespace as characters
  txt = gsub(" ", "", txt)
  charcount <- charcount + nchar(txt)
}

print(charcount)  # 21,124
