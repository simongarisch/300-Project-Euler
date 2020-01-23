package main

import (
	"math"
	"strconv"
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

func digitRotations(x int) ([]int, error) {
	var rotations []int
	xstr := strconv.Itoa(x)

	for _, char := range xstr {
		schar := string(char)
		left := xstr[:i]
		right := xstr[i:]
		rotation, err := strconv.Atoi(right + left)
		if err != nil {
			return rotations, err
		}
	}

}

func main() {

}
