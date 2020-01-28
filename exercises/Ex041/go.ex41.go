package main

import (
	"fmt"
	"math"
	"sort"
	"strconv"

	prmt "github.com/gitchander/permutation"
)

const digits = "123456789"

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

func sliceToNumber(slice []string) (int, error) {
	numStr := ""
	for _, item := range slice {
		numStr += item
	}

	return strconv.Atoi(numStr)
}

func main() {
	n := len(digits)
	largest := 0

	for {
		if n < 1 || largest != 0 {
			break
		}
		subdigits := digits[:n]

		var chars []string
		for _, num := range subdigits {
			chars = append(chars, string(num))
		}

		var perms []int
		gen := prmt.New(prmt.StringSlice(chars))
		for gen.Next() {
			num, err := sliceToNumber(chars)
			if err != nil {
				panic(err)
			}
			perms = append(perms, num)
		}
		sort.Ints(perms)

		for i := len(perms) - 1; i >= 0; i-- {
			perm := perms[i]
			if isPrime(perm) {
				largest = perm
				break
			}
		}
		n--
	}
	fmt.Println(largest) // 7,652,413
}
