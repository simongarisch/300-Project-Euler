%{
Using names.txt (right click and 'Save Link/Target As...'),
a 46K text file containing over five-thousand first names,
begin by sorting it into alphabetical order.

Then working out the alphabetical value for each name,
multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order,
COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list.
So, COLIN would obtain a score of 938 * 53 = 49714.

What is the total of all the name scores in the file?
%}

dire_path = fileparts(mfilename("fullpath"));
file_path = strcat(dire_path, "/names.txt");
#exist(file_path);

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
end
content = strrep(content, '"', "");
names = sort(strsplit(content, ","));


alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
scores = 1:length(alphabet);
global scores_mapping = struct();
for i = scores
  letter = alphabet(i);
  scores_mapping.(letter) = i;
end


function name_score = get_name_score(name)
  global scores_mapping;
  name_score = 0;
  for i =1:length(name)
    char = substr(name, i, 1);
    if strcmp(char, '') == 1
      break;
    end
    name_score += scores_mapping.(char);
  end
end
#get_name_score("COLIN")  # 53


total_score = 0;
for i = 1:length(names)
  name = deblank(names{i});
  name_score = get_name_score(name);
  total_score += i * name_score;
end
disp(total_score)  # 871,198,282
