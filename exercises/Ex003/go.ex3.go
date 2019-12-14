package main

import (
	"fmt"
	"math"
)

func isPrime(x int) bool {
	// returns true if x is prime, false otherwise.
	if x == 2 || x == 3 {
		return true
	}
	for i := 2; i <= int(math.Pow(float64(x), 0.5)); i++ {
		if (x % i) == 0 {
			return false
		}
	}
	return true
}

func main() {
	/*
		for i := 1; i <= 10; i++ {
			fmt.Println(i, isPrime(i))
		}
	*/
	var largest int = 0
	var target int = 600851475143
	for i := 2; i <= int(math.Pow(float64(target), 0.5)); i++ {
		if (target % i) == 0 {
			if isPrime(i) {
				largest = i
			}
		}
	}

	fmt.Println(largest) // 6,857
}
