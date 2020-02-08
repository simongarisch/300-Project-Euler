package main

import (
	"math"
	"strconv"

	gocomb "github.com/mxschmitt/golang-combinations"
)

const (
	start        = 1
	stop         = 1e6
	targetPrimes = 8
	digits       = "0123456789"
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

func collectPrimes(start, stop int) []int {
	var primes []int
	for i := start; i < stop; i++ {
		if isPrime(i) {
			primes = append(primes, i)
		}
	}
	return primes
}

func collectDigitReplacements(ndigits int) [][]int {
	var digits []string
	for i := 0; i < ndigits; i++ {
		digits = append(digits, strconv.Itoa(i))
	}

	combinations := gocomb.All(digits)
	var filtered [][]int
	for _, comb := range combinations {
		if len(comb) < ndigits {
			var intitem []int
			for _, stritem := range comb {
				i, _ := strconv.Atoi(stritem)
				intitem = append(intitem, i)
			}
			filtered = append(filtered, intitem)
		}
	}
	return filtered
}

func main() {
	//fmt.Println(collectPrimes(0, 20)) // [2 3 5 7 11 13 17 19]
	//fmt.Println(collectDigitReplacements(2)) // [[0] [1]]
	//fmt.Println(collectDigitReplacements(3)) // [[0] [1] [0 1] [2] [0 2] [1 2]]

}
