/*
kotlinc -script ./exercises/Ex010/KotlinEx10.kts

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.
*/

fun isPrime(x: Long): Boolean {
    if (x <= 1L) {
        return false
    }

    if (x == 2L || x == 3L) {
        return true
    }
    
    for (i in 2L..<x) {
        if (x % i == 0L) {
            return false
        }
    }

    return true
}

var sum: Long = 0L
for (i:Long in 1L..<2_000_000L) {
    if (isPrime(i)) {
        sum += i
    }
}

println(sum) // 142,913,828,922
