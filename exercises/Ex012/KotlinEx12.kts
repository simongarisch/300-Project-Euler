// kotlinc -script ./exercises/Ex012/KotlinEx12.kts
import kotlin.math.sqrt

val targetFactors = 500
var triangleNumber = 1
var numFactors = 1
var counter = 1

while (numFactors < targetFactors) {
    counter++
    triangleNumber += counter
    numFactors = 2 // divisible by itself and one
    for (i in 2..sqrt(triangleNumber.toDouble()).toInt()) {
        if (triangleNumber % i == 0) {
            if (i * i == triangleNumber) {
                numFactors++
            } else {
                numFactors += 2
            }
        }
    }
}

println(triangleNumber) // 76,576,500
