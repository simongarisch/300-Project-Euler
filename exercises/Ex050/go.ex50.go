package main

import (
	"fmt"
	"math"
)

const maxprime = 1e6

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

func getPrimes() []int {
	var primes []int
	for i := 0; i < maxprime; i++ {
		if isPrime(i) {
			primes = append(primes, i)
		}
	}
	return primes
}

func cumsum(slice []int) []int {
	cumsumArr := []int{0}
	cumsum := 0
	for i := 0; i < len(slice); i++ {
		cumsum += slice[i]
		cumsumArr = append(cumsumArr, cumsum)
	}
	return cumsumArr
}

func contains(slice []int, x int) bool {
	for i := 0; i < len(slice); i++ {
		if slice[i] == x {
			return true
		}
	}
	return false
}

func main() {
	primes := getPrimes()
	primesCumsum := cumsum(primes)
	primesLen := len(primes)

	found := false
	whichPrime := 0
	whichLen := primesLen

	for {
		if found {
			break
		}
		for i := 0; i < (primesLen - whichLen + 1); i++ {
			diff := primesCumsum[i+whichLen] - primesCumsum[i]
			if diff > maxprime {
				break
			}
			if contains(primes, diff) {
				found = true
				whichPrime = diff
				break
			}
		}
		whichLen--
	}

	fmt.Println(whichPrime) // 997,651
}
