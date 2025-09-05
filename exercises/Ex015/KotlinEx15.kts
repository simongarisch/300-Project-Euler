// kotlinc -script ./exercises/Ex015/KotlinEx15.kts
import java.math.BigInteger

val size = 20
var choices = 1.toBigInteger()

for (i in 1..size) {
    choices = choices.multiply(((2*size) - (size - i)).toBigInteger())
    choices = choices.divide(i.toBigInteger())
}

println(choices) // 137,846,528,820
