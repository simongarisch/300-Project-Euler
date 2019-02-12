'''
Using names.txt (right click and 'Save Link/Target As...'),
a 46K text file containing over five-thousand first names,
begin by sorting it into alphabetical order.

Then working out the alphabetical value for each name,
multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order,
COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list.
So, COLIN would obtain a score of 938 * 53 = 49714.

What is the total of all the name scores in the file?
'''

import os
import string

dire_path = os.path.dirname(os.path.realpath(__file__))
file_path = os.path.join(dire_path, "names.txt")
with open(file_path, "r") as fi:
    contents = fi.read()

names = [str(name).lower().strip().replace('"', '')
         for name in sorted(contents.split(","))]
#print(names)

alphabet = string.ascii_lowercase
scores = range(1, len(alphabet)+1)
scores_mapping = dict(zip(alphabet, scores))
#print(scores_mapping)

def get_name_score(name):
    global scores_mapping
    name_score = 0
    for char in name:
        name_score += scores_mapping[char]
    return name_score

total_score = 0
for index, name in enumerate(names):
    name_score = get_name_score(name)
    total_score += (index + 1) * name_score

print(total_score)  # 871,198,282
