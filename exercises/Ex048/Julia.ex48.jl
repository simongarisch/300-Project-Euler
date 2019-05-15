#=
The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
=#

START = 1
STOP = 1000

function ex48()::Int
    global START, STOP
    current::Int = START
    totsum::BigInt = BigInt(START)
    while current < STOP
        current += 1
        totsum += BigInt(current) ^ current
    end

    numstr::String = string(totsum)
    last_ten_digits::Int = parse(Int, numstr[length(numstr)-9:end])
    return last_ten_digits
end

println(ex48())  # 9,110,846,700
