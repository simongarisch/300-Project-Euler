/*
kotlinc -script ./exercises/Ex005/KotlinEx5.kts

2520 is the smallest number that can be divided by each of the numbers
from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of
the numbers from 1 to 20?
*/

fun isDivisibleTo20(x:Long) : Boolean {
    for (i:Long in 1L..20L) {
        if (x % i != 0L) {
            return false
        }
    }
    return true
}

var counter: Long = 1L
while (!isDivisibleTo20(counter)) {
    counter += 1L
}

println(counter) // 232,792,560
