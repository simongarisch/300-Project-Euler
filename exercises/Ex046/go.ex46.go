package main

import (
	"fmt"
	"math"
)

const maxn = 1e4

func isPrime(x int) bool {
	if x < 2 {
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

func generateOddCompos(n int) []int {
	var compos []int
	for i := 2; i <= n; i++ {
		for j := 2; j <= n; j++ {
			mult := i * j
			if mult%2 == 1 {
				compos = append(compos, mult)
			}
		}
	}
	return compos
}

func generatePrimes(n int) []int {
	var primes []int
	for i := 1; i <= n; i++ {
		if isPrime(i) {
			primes = append(primes, i)
		}
	}
	return primes
}

func generateSquares(n int) []int {
	var squares []int
	for i := 0; i <= int(math.Pow(float64(n), 0.5))+1; i++ {
		squares = append(squares, i*i)
	}
	return squares
}

func findSmallest(n int) int {
	compos := generateOddCompos(n)
	primes := generatePrimes(n)
	squares := generateSquares(n)
	searchmap := make(map[int]bool)

	for i := 0; i < len(primes); i++ {
		for j := 0; j < len(squares); j++ {
			comb := primes[i] + 2*squares[j]
			searchmap[comb] = true
		}
	}

	for i := 0; i < 10; i++ {
		fmt.Println(compos[i], primes[i], squares[i])
	}

	x, ok := searchmap[5777]
	fmt.Println(x, ok)

	smallest := 0
	for _, compo := range compos {
		_, ok := searchmap[compo]
		//fmt.Println(compo, ok)
		if !ok {
			smallest = compo
			break
		}
	}

	return smallest
}

func main() {
	smallest := findSmallest(maxn)
	fmt.Println(smallest) //
}
