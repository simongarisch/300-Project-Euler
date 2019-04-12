
# The nth term of the sequence of triangle numbers is given by,
# tn = 0.5n(n+1); so the first ten triangle numbers are:
#
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
# By converting each letter in a word to a number corresponding to its
# alphabetical position and adding these values we form a word value.
# For example, the word value for SKY is 19 + 11 + 25 = 55 = t10.
# If the word value is a triangle number then we shall call the word a triangle word.
#
# Using words.txt (right click and 'Save Link/Target As...'),
# a 16K text file containing nearly two-thousand common English words,
# how many are triangle words?

args <- commandArgs(trailingOnly = F)
dire_path <- normalizePath(dirname(sub("^--file=", "", args[grep("^--file=", args)])))
file_path <- file.path(dire_path, "words.txt")
df <- read.table(file_path, sep="\n")
words <- strsplit(as.character(df[1,]), ",")[[1]]
#print(words)

# generate some triangle numbers
cumsum <- 0
tnums <- c()
for(i in 1:100){
  cumsum <- cumsum + i
  tnums <- c(tnums, cumsum)
}
#print(tnums[1:10])  # [1]  1  3  6 10 15 21 28 36 45 55

scores_mapping <- 1:length(LETTERS)
names(scores_mapping) <- LETTERS
#print(scores_mapping)

get_word_score <- function(word){
  word_score <- 0
  word_split <- strsplit(word, "")[[1]]
  for(char in word_split){
    word_score <- word_score + scores_mapping[char][[1]]
  }
  return(word_score)
}


is_triangle_word <- function(word){
  score <- get_word_score(word)
  if(score %in% tnums){
    return(TRUE)
  }else{
    return(FALSE)
  }
}

total_words <- 0
for(i in 1:length(words)){
  word <- words[i]
  if(is_triangle_word(word)){
    total_words <- total_words + 1
  }
}

print(total_words)  # 162
