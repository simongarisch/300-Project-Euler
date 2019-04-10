'''
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
'''
import os
import string

# read the words.txt file
dire_path = os.path.dirname(os.path.realpath(__file__))
file_path = os.path.join(dire_path, "words.txt")
with open(file_path, "r") as fi:
    content = fi.read()
#print(content)

# generage some triangle numbers
cumsum = 0
tnums = []
for i in range(1,100):
    cumsum += i
    tnums.append(cumsum)
#print(tnums[:10])  # [1, 3, 6, 10, 15, 21, 28, 36, 45, 55]

words = [str(word).lower().strip().replace('"', '')
         for word in content.split(",")]
#print(words)

alphabet = string.ascii_lowercase
scores = range(1, len(alphabet)+1)
scores_mapping = dict(zip(alphabet, scores))
#print(scores_mapping)

def get_word_score(word):
    global scores_mapping
    word_score = 0
    for char in word:
        word_score += scores_mapping[char]
    return word_score


def is_triangle_word(word):
    global tnums
    score = get_word_score(word)
    if score in tnums:
        return True
    return False

total_words = sum([is_triangle_word(word) for word in words])

print(total_words)  # 162
