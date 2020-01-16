package main

import (
	"fmt"
	"math"
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

func quadraticFormula(n, a, b int) int {
	return n*n + a*n + b
}

func main() {

	primesmap := make(map[int]bool) // cache prime calculation results
	maxprimes := 0
	product := 0

	// where |a| < 1000 and |b| leq 1000
	for a := -999; a <= 999; a++ {
		for b := -1000; b <= 1000; b++ {
			n := 0
			var isprime, ok bool
			isprime = true
			for {
				if !isprime {
					break
				}
				qfresult := quadraticFormula(n, a, b)
				isprime, ok = primesmap[qfresult]
				if !ok {
					isprime = isPrime(qfresult)
					primesmap[qfresult] = isprime
				}
				if isprime {
					n++
					if n > maxprimes {
						maxprimes = n
						product = a * b
					}
				}
			}
		}
	}

	fmt.Println(product) // -59,231
}
