package main

import (
	"fmt"
	"strconv"
)

func factorial(n int) int {
	if n == 0 {
		return 1
	}
	return n * factorial(n-1)
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

func pow(a, b int) int {
	result := 1
	for i := 1; i <= b; i++ {
		result *= a
	}
	return result
}

func getMaxDigits() int {
	digit := 1
	for {
		if factorial(9)*digit <= pow(digit-1, 10) {
			break
		}
		digit++
	}
	return digit
}

func main() {
	//fmt.Println(isCurious(145))  // true <nil>
	digits := getMaxDigits()
	var curiousNumbers []int

	for x := 3; x < pow(10, digits); x++ {
		curious, err := isCurious(x)
		if err != nil {
			panic(err)
		}
		if curious {
			curiousNumbers = append(curiousNumbers, x)
		}
	}

	sumCurious := 0
	for _, number := range curiousNumbers {
		sumCurious += number
	}

	fmt.Println(sumCurious) // 40,730
}
