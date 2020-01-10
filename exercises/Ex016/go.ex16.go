package main

import (
	"fmt"
	"math/big"
	"strconv"
)

func main() {
	var num big.Int
	num.Exp(big.NewInt(2), big.NewInt(1000), nil)

	numstr := num.String()

	sum := 0
	for _, char := range numstr {
		i, err := strconv.Atoi(string(char))
		if err != nil {
			panic(err)
		}
		sum += i
	}

	fmt.Println(sum) // 1,366
}
