package main

import (
	"errors"
	"fmt"
	"math"
	"sort"
	"strconv"
	"strings"
)

const (
	start     = 1488
	stop      = 1e4
	increment = 3330
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

func sortString(w string) string {
	s := strings.Split(w, "")
	sort.Strings(s)
	return strings.Join(s, "")
}

func isPermutation(a, b int) bool {
	astr := strconv.Itoa(a)
	bstr := strconv.Itoa(b)
	return sortString(astr) == sortString(bstr)
}

func primePerms() ([]int, error) {
	var primes []int
	var result []int
	for i := start; i <= stop; i++ {
		if isPrime(i) {
			primes = append(primes, i)
		}
	}

	numPrimes := len(primes)
	var prime1, prime2, prime3 int

	for i := 1; i < numPrimes; i++ {
		prime1 = primes[i]
		for j := i + 1; j < numPrimes; j++ {
			prime2 = primes[j]
			for k := j + 1; k < numPrimes; k++ {
				prime3 = primes[k]
				if prime1+increment == prime2 {
					if prime2+increment == prime3 {
						if isPermutation(prime1, prime2) {
							if isPermutation(prime2, prime3) {
								result = []int{prime1, prime2, prime3}
								return result, nil
							}
						}
					}
				}
			}
		}
	}
	return result, errors.New("primes not found")
}

func main() {
	primes, err := primePerms()
	if err != nil {
		panic(err)
	}

	primesString := ""
	for _, prime := range primes {
		primesString = primesString + strconv.Itoa(prime)
	}

	number, err := strconv.Atoi(primesString)
	if err != nil {
		panic(err)
	}

	fmt.Println(number) // 296,962,999,629
}
