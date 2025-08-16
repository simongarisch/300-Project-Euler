// sdk install kotlin
// kotlinc -script ./exercises/Ex002/KotlinEx2.kts

fun main() {
    val maxValue: Int = 4_000_000
    val fib: MutableList<Int> = mutableListOf(1, 2)
    var sum: Int = 2

    while (true) {
        val i = fib.lastIndex
        val nextValue: Int = fib[i] + fib[i-1]

        if (nextValue > maxValue) {
            break
        }

        if (nextValue % 2 == 0) {
            sum += nextValue
        }

        fib.add(nextValue)
    }

    println(sum) // 4,613,732
}

main()
