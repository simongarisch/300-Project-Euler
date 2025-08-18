/*
kotlinc -script ./exercises/Ex007/KotlinEx7.kts

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
that the 6th prime is 13.
What is the 10,001st prime number?
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

var number: Long = 0L
var counter: Long = 0L

while (counter < 10001) {
    number++
    if (isPrime(number)) {
        counter++
    }
}

println(number) // 104,743
