package main

import (
	"fmt"
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

	for i := range xstr {
		left := xstr[:i]
		right := xstr[i:]
		rotation, err := strconv.Atoi(right + left)
		if err != nil {
			return rotations, err
		}
		rotations = append(rotations, rotation)
	}

	return rotations, nil
}

func allPrimes(nums []int) bool {
	for _, x := range nums {
		if !isPrime(x) {
			return false
		}
	}
	return true
}

func isCircularPrime(x int) (bool, error) {
	rotations, err := digitRotations(x)
	if err != nil {
		return false, err
	}
	return allPrimes(rotations), nil
}

func main() {
	//fmt.Println(digitRotations(197)) // [197 971 719] <nil>
	counter := 0
	for x := 1; x < 1e6; x++ {
		isCircPrime, err := isCircularPrime(x)
		if err != nil {
			panic(err)
		}
		if isCircPrime {
			counter++
		}
	}

	fmt.Println(counter) // 55
}
