#=
Using names.txt (right click and 'Save Link/Target As...'),
a 46K text file containing over five-thousand first names,
begin by sorting it into alphabetical order.

Then working out the alphabetical value for each name,
multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order,
COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list.
So, COLIN would obtain a score of 938 * 53 = 49714.

What is the total of all the name scores in the file?
=#

using DelimitedFiles

dire_path = @__DIR__
file_path = joinpath(dire_path, "names.txt")
content = readdlm(file_path, ',')
content = string.(content)
#=
Careful as Julia reads the name 'NAN' as NaN,
thinking that there is missing data.
Make this uppercase again for sorting.
=#
names = [uppercase(name) for name in content]
names = sort(names[:])
#println(names)


alphabet = 'A':'Z'
scores = 1:length(alphabet)
scores_mapping = Dict(zip(alphabet, scores))
#println(scores_mapping)

function get_name_score(name)
    global scores_mapping
    name_score = 0
    for char in name
        name_score += scores_mapping[char]
    end
    return name_score
end
#print(get_name_score("COLIN"))  # 53

total_score = 0
for (index, name) in enumerate(names)
    global total_score
    name_score = get_name_score(uppercase(string(name)))
    total_score += index * name_score
end
println(total_score)  # 871,198,282
