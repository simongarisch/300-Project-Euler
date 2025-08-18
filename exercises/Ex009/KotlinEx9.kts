/*
kotlinc -script ./exercises/Ex009/KotlinEx9.kts

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a^2 + b^2 = c^2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
*/

var product: Long = 0L

for (a:Long in 1L..1000L) {
    for (b:Long in (a+1L)..1000L) {
        for (c:Long in (b+1L)..1000L) {
            if (a+b+c==1000L && a*a + b*b == c*c) {
                product = a * b * c
                break
            }
        }
    }
}

println(product) // 31,875,000
