/*
https://medium.com/code-adventures/profiling-golang-851db2d9ae24
go get github.com/pkg/profile

go build go.ex51.go
./go.ex51.exe
This will give you the location of cpu.pprof which we can turn to pdf...

go tool pprof --pdf ./go.ex51.exe path\to\cpu.pprof > cpuprofile.pdf
*/

package main

import (
	"fmt"
	"math"
	"sort"
	"strconv"
	"strings"

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

func str2slice(s string) []string {
	var result []string
	for _, char := range s {
		charstr := string(char)
		result = append(result, charstr)
	}
	return result
}

func slice2str(slice []string) string {
	s := ""
	for _, char := range slice {
		s += string(char)
	}
	return s
}

// return only numbers with n digits
// also return numbers with combinations of * inserted
func filterNdigit(primesSlice []int, n int) ([]int, []string) {
	var primesFiltered []int
	var primesStrings []string
	for _, prime := range primesSlice {
		primestr := strconv.Itoa(prime)
		if len(primestr) == n {
			primesFiltered = append(primesFiltered, prime)
			primesStrings = append(primesStrings, primestr)
		}
	}

	replacements := collectDigitReplacements(n)
	var stars []string
	for _, prime := range primesStrings {
		for _, replacement := range replacements {
			pslice := str2slice(prime)
			for _, index := range replacement {
				pslice[index] = "*"
			}
			stars = append(stars, slice2str(pslice))
		}
	}

	return primesFiltered, stars
}

func isin(elem int, slice []int) bool {
	for _, value := range slice {
		if value == elem {
			return true
		}
	}
	return false
}

func makeCounterMap(slice []string) map[string]int {
	result := make(map[string]int)
	sort.Strings(slice)

	prevValue := ""
	count := 0
	for _, value := range slice {
		if value != prevValue {
			count = 1
		} else {
			count++
		}
		result[value] = count
		prevValue = value
	}
	return result
}

func minIntSlice(slice []int) int {
	sort.Ints(slice)
	return slice[0]
}

// check for unique pattern groups with n or more digits
func ndigitFamily(primesSlice []int, n int, targetPrimes int) int {
	primesFiltered, stars := filterNdigit(primesSlice, n)
	counterMap := makeCounterMap(stars)
	var minAll []int // the minimum prime from all groups

	for key := range counterMap {
		value := counterMap[key]
		if value < targetPrimes {
			continue
		}

		countPrimes := 0
		var primes []int
		for _, digit := range digits {
			digitstr := string(digit)
			valuestr := strings.ReplaceAll(key, "*", digitstr)
			valueint, _ := strconv.Atoi(valuestr)
			if len(valuestr) == n {
				if isin(valueint, primesFiltered) {
					countPrimes++
					primes = append(primes, valueint)
				}
			}
		}

		if countPrimes == targetPrimes {
			minAll = append(minAll, minIntSlice(primes))
		}
	}

	if len(minAll) == 0 {
		return -1
	}
	return minIntSlice(minAll)
}

func main() {
	//fmt.Println(collectPrimes(0, 20)) // [2 3 5 7 11 13 17 19]
	//fmt.Println(collectDigitReplacements(2)) // [[0] [1]]
	//fmt.Println(collectDigitReplacements(3)) // [[0] [1] [0 1] [2] [0 2] [1 2]]

	//primesSlice := collectPrimes(0, 1e2)
	//primesFiltered, stars := filterNdigit(primesSlice, 2)
	//fmt.Println(primesFiltered) // [11 13 17 19 23 29 31 37 41 ...
	//fmt.Println(stars)          // [*1 1* *3 1* *7 1* *9 1* ...

	//fmt.Println(makeCounterMap([]string{"1", "2", "3", "2", "3"})) // map[1:1 2:2 3:2]
	//fmt.Println(ndigitFamily(collectPrimes(0, 1e3), 2, 6)) // 13
	//fmt.Println(ndigitFamily(collectPrimes(0, 1e6), 5, 7)) // 56003

	//defer profile.Start().Stop()
	//fmt.Println(ndigitFamily(collectPrimes(0, 1e6), 5, 7))

	primesSlice := collectPrimes(start, stop)
	ndigits := 1
	result := -1
	for {
		if result != -1 {
			break
		}
		ndigits++
		result = ndigitFamily(primesSlice, ndigits, targetPrimes)
	}

	fmt.Println(result) // 121,313
}
