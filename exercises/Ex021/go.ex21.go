package main

import "fmt"

func sumDivisors(x int) int {
	sum := 0
	for i := 1; i < x; i++ {
		if x%i == 0 {
			sum += i
		}
	}
	return sum
}

func isAmicable(x int) bool {
	sumDivx := sumDivisors(x)
	if sumDivx == x {
		return false
	}
	if sumDivisors(sumDivx) == x {
		return true
	}
	return false
}

func main() {
	sum := 0
	for x := 1; x <= 1e4; x++ {
		if isAmicable(x) {
			sum += x
		}
	}
	fmt.Println(sum) // 31,626
}
