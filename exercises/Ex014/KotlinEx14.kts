// kotlinc -script ./exercises/Ex014/KotlinEx14.kts
// kotlinc KotlinEx14.kt -include-runtime -d KotlinEx14.jar
// java -jar KotlinEx14.jar

fun main() {
    var longestChain = 0
    var starting = 0

    for (i in 1..1_000_000) {
        var terms = 1
        var num = i
        while (num != 1) {
            if (num % 2 == 0) {
                num = num / 2
            } else {
                num = 3 * num + 1
            }
            terms++
        }

        if (terms > longestChain) {
            longestChain = terms
            starting = i
        }
    }

    println(starting)
}

main()
