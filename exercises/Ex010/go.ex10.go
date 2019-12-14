package main

import (
	"fmt"
	"math"
)

func isPrime(x int) bool {
	if x == 0 || x == 1 {
		return false
	}
	if x == 2 {
		return true
	}
	for i := 2; i < int(math.Pow(float64(x), 0.5))+1; i++ {
		if x%i == 0 {
			return false
		}
	}
	return true
}

func main() {
	var sum = 0
	for i := 0; i < 2e6; i++ {
		if isPrime(i) {
			sum += i
		}
	}
	fmt.Println(sum) // 142,913,828,922
}
