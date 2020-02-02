package main

import (
	"fmt"
	"math"
)

const (
	maxprime      = 1e3
	targetFactors = 4
)

func isPrime(x int) bool {
	if x <= 1 {
		return false
	}
	if x == 2 {
		return true
	}
	for i := 2; i <= int(math.Pow(float64(x), 0.5))+1; i++ {
		if x%i == 0 {
			return false
		}
	}
	return true
}

func getPrimes(maxprime int) []int {
	var primes []int
	for i := 1; i <= maxprime; i++ {
		if isPrime(i) {
			primes = append(primes, i)
		}
	}
	return primes
}

func multFactors(factors []int) []int {
	result := 1
	// straight multiplication
	for _, factor := range factors {
		result *= factor
	}

	results := []int{result}
	// where we have a ^2
	for _, factor := range factors {
		results = append(results, result*factor)
	}
	return results
}

func contains(slice []int, n int) bool {
	for _, value := range slice {
		if value == n {
			return true
		}
	}
	return false
}

func main() {
	primes := getPrimes(maxprime)
	sequence := 0
	n := 0

	for {
		n++
		factors := 0
		var primeFactors []int
		for _, prime := range primes {
			if n%prime == 0 {
				factors++
				primeFactors = append(primeFactors, prime)
			}
			if prime > n {
				break
			}
		}

		if factors == targetFactors {
			multiples := multFactors(primeFactors)
			if contains(multiples, n) {
				sequence++
			} else {
				sequence = 0
			}
		} else {
			sequence = 0
		}

		if sequence == targetFactors {
			break
		}
	}

	first := n - targetFactors + 1
	fmt.Println(first) // 134,043
}
