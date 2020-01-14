package main

import (
	"fmt"
	"math/big"
	"strconv"
)

func fact(n *big.Int) *big.Int {
	result := big.NewInt(1)
	one := big.NewInt(1)

	for {
		if n.Cmp(one) == 0 {
			break
		}

		result.Mul(result, n)
		n.Sub(n, one)
	}
	return result
}

func main() {
	numstr := fact(big.NewInt(100)).String()
	//fmt.Println(numstr) // 93326215 ...

	sum := 0
	for _, c := range numstr {
		i, err := strconv.Atoi(string(c))
		if err != nil {
			panic(err)
		}
		sum += i
	}

	fmt.Println(sum) // 648
}
