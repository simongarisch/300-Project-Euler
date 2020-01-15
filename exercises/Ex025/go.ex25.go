package main

import (
	"fmt"
	"math/big"
)

func getNumberLength(num *big.Int) int {
	str := num.String()
	return len(str)
}

func main() {
	one := big.NewInt(1)
	fibindex := big.NewInt(3)

	fib1 := big.NewInt(1)
	fib2 := big.NewInt(1)
	fibvalue := big.NewInt(2)

	for {
		fiblen := getNumberLength(fibvalue)
		if fiblen >= 1000 {
			break
		}

		fibindex.Add(fibindex, one)
		fib1.Set(fib2)
		fib2.Set(fibvalue)
		fibvalue.Add(fib1, fib2)
	}

	fmt.Println(fibindex) // 4,782
}
