%{
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
%}

dire_path = fileparts(mfilename("fullpath"));
file_path = strcat(dire_path, "/words.txt")
#exist(file_path)

content = "";
fi = fopen(file_path, "r");
while true
  # Get the current line
  ln = fgetl(fi);
  content = strcat(content, ln);
  
  # Stop if EOFS
  if ln == -1
    break;
  endif
endwhile
content = strrep(content, '"', "");
content = strrep(content, ' ', "");
words = sort(strsplit(content, ","));

tnums = cumsum(cumsum(ones(1,100)));

alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
scores = 1:length(alphabet);
global scores_mapping = struct();
for i = scores
  letter = alphabet(i);
  scores_mapping.(letter) = i;
endfor


function word_score = get_word_score(word)
  global scores_mapping;
  global alphabet;
  word_score = 0;
  for i =1:length(word)
    char = substr(word, i, 1);
    try
      word_score += scores_mapping.(char);
    catch
      #printf ("Unable to find char: %s\n", char)
    end
  endfor
endfunction


function triangle_word = is_triangle_word(word)
  global tnums;
  score = get_word_score(word);
  triangle_word = sum(tnums == score);
endfunction


total_words = 0;
for i = 1:length(words)
  word = words{1,i};
  if is_triangle_word(word)
    total_words += 1;
  endif
endfor

disp(total_words)
