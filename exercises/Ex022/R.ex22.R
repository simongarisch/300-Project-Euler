
# Using names.txt (right click and 'Save Link/Target As...'),
# a 46K text file containing over five-thousand first names,
# begin by sorting it into alphabetical order.
#
# Then working out the alphabetical value for each name,
# multiply this value by its alphabetical position in the list to obtain a name score.
#
# For example, when the list is sorted into alphabetical order,
# COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list.
# So, COLIN would obtain a score of 938 * 53 = 49714.
#
# What is the total of all the name scores in the file?

args <- commandArgs(trailingOnly = F)
dire_path <- normalizePath(dirname(sub("^--file=", "", args[grep("^--file=", args)])))
file_path <- file.path(dire_path, "names.txt")
df <- read.table(file_path, sep="\n")

names <- strsplit(as.character(df[1,]), ",")
names <- list(sort(unlist(names)))

scores_mapping <- 1:length(LETTERS)
names(scores_mapping) <- LETTERS
#print(scores_mapping)

get_name_score <- function(name){
  name_score <- 0
  name_split <- strsplit(name, "")[[1]]
  for(char in name_split){
    name_score = name_score + scores_mapping[char][[1]]
  }
  return(name_score)
}
#print(get_name_score("COLIN"))  # 53

total_score = 0
counter = 0
for(name in names[[1]]){
   counter = counter + 1
   name_score = get_name_score(name)
   total_score = total_score + counter * name_score
}

print(total_score)  # 871,198,282
