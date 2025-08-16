// sdk install kotlin
// kotlinc -script ./exercises/Ex001/KotlinEx1.kts

fun main() {
    var sum = 0
    for (i in 1..<1000) {
        if (i % 3 == 0 || i % 5 == 0) {
            sum += i
        }
    }

    println(sum) // 233,168
}

main()
