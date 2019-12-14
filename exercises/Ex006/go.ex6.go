package main

import "fmt"

func main() {
	var sum int = 0
	var sumOfSquares int = 0
	for i := 1; i <= 100; i++ {
		sum += i
		sumOfSquares += i * i
	}

	var squareOfSum = sum * sum
	fmt.Println(squareOfSum - sumOfSquares) // 25,164,150
}
