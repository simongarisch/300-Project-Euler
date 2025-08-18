/*
kotlinc -script ./exercises/Ex003/KotlinEx3.kts

The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
*/
import kotlin.math.sqrt


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

fun main() {
    var largest: Long = 0
    val target: Long = 600851475143

    for (i in 2L..sqrt(target.toDouble()).toLong()) {
        if (target % i == 0L) { // it's a factor
            if (isPrime(i)) {    // and a prime
                largest = i
            }
        }
    }

    println(largest) // 6857
}

main()
