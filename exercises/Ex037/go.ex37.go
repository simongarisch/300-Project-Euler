package main

import (
	"fmt"
	"math"
	"strconv"
)

const stop = 11

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

func isTruncatable(x int) (bool, error) {
	xstr := strconv.Itoa(x)

	for i := 0; i < len(xstr); i++ {
		left := xstr[:i]
		right := xstr[i:]

		if len(left) != 0 {
			leftnum, err := strconv.Atoi(left)
			if err != nil {
				return false, err
			}
			if !isPrime(leftnum) {
				return false, nil
			}
		}

		rightnum, err := strconv.Atoi(right)
		if err != nil {
			return false, err
		}
		if !isPrime(rightnum) {
			return false, nil
		}
	}

	return true, nil
}

func main() {
	//fmt.Println(isTruncatable(3797))  // true <nil>
	found := 0
	totsum := 0
	x := 8
	for {
		if found >= stop {
			break
		}
		if isPrime(x) {
			trunc, err := isTruncatable(x)
			if err != nil {
				panic(err)
			}
			if trunc {
				found++
				totsum += x
			}
		}
		x++
	}

	fmt.Println(totsum) // 748,317
}
