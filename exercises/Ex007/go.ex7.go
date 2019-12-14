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
	for i := 2; i <= int(math.Pow(float64(x), 0.5)); i++ {
		if x%i == 0 {
			return false
		}
	}
	return true
}

func main() {
	var number, counter = 0, 0
	for {
		number++
		if isPrime(number) {
			counter++
		}
		if counter > 1e4 {
			break
		}
	}

	fmt.Println(number) // 104,743
}
