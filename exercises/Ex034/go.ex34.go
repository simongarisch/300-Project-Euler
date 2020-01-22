package main

import (
	"strconv"
)

func factorial(n int) int {
	if n == 0 {
		return 1
	}
	return n * factorial(n-1)
}

func pow(a, b int) int {
	if b == 0 {
		return 1
	}
	result := a
	for i := 2; i <= b; i++ {
		result *= a
	}
	return result
}

// returns true if x is equal to the sum its digit factorials,
// false otherwise
func isCurious(x int) (bool, error) {
	sumfact := 0
	xstr := strconv.Itoa(x)
	for _, char := range xstr {
		schar := string(char)
		ichar, err := strconv.Atoi(schar)
		if err != nil {
			return false, err
		}
		sumfact += factorial(ichar)
	}

	if x == sumfact {
		return true, nil
	}
	return false, nil
}

func main() {
	//fmt.Println(isCurious(145))  // true <nil>
}
