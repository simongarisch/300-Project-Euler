package main

import (
	"fmt"
	"strconv"
)

func pow(a, b int) int {
	x := 1
	for i := 1; i <= b; i++ {
		x *= a
	}
	return x
}

func digitPowersEqual(number, power int) (bool, error) {
	var equal bool
	numstr := strconv.Itoa(number)
	powSum := 0
	for _, char := range numstr {
		digit, err := strconv.Atoi(string(char))
		if err != nil {
			return equal, err
		}
		powSum += pow(digit, power)
	}
	equal = (powSum == number)
	return equal, nil
}

func main() {
	power := 5
	ubound := power * pow(9, power)
	//fmt.Println(digitPowersEqual(1634, 4))

	total := 0
	num := 2
	for {
		if num > ubound {
			break
		}

		equal, err := digitPowersEqual(num, power)
		if err != nil {
			panic(err)
		}

		if equal {
			total += num
		}

		num++
	}

	fmt.Println(total) // 443,839
}
