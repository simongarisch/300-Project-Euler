#=
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
=#
using DelimitedFiles

dire_path = @__DIR__
file_path = joinpath(dire_path, "words.txt")
content = readdlm(file_path, ',')
#println(content)

words = [uppercase(word) for word in content]
words = sort(words[:])
#println(words)

cumsum = 0
tnums = []
for i in 1:100
    global cumsum += i
    push!(tnums, cumsum)
end
#print(tnums[1:10])  # Any[1, 3, 6, 10, 15, 21, 28, 36, 45, 55]

alphabet = 'A':'Z'
scores = 1:length(alphabet)
scores_mapping = Dict(zip(alphabet, scores))
#println(scores_mapping)


function get_word_score(word)
    global scores_mapping
    word_score = 0
    for char in word
        word_score += scores_mapping[char]
    end
    return word_score
end

function is_triangle_word(word)
    global tnums
    score = get_word_score(word)
    if score in tnums
        return true
    else
        return false
    end
end

total_words = sum([is_triangle_word(word) for word in words])

print(total_words)  # 162
