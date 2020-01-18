package main

import (
	"fmt"
	"math/big"
	"strconv"
)

func main() {
	terms := make(map[string]bool)
	a := new(big.Int)
	b := new(big.Int)

	for i := 2; i <= 100; i++ {
		for j := 2; j <= 100; j++ {
			a.SetString(strconv.Itoa(i), 10)
			b.SetString(strconv.Itoa(i), 10)
			for k := 2; k <= j; k++ {
				b.Mul(b, a)
			}
			terms[b.String()] = true
		}
	}

	fmt.Println(len(terms)) // 9,183
}
