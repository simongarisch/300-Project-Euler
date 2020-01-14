package main

import (
	"fmt"
	"math/big"
)

func fact(n big.Int) big.Int {
	result := big.NewInt(1)
	stopCondition := big.NewInt(1)
	for {
		if n == stopCondition {
			break
		}
		result = result * n
		n--
	}
	return result
}

func main() {
	n := big.NewInt(100)
	fmt.Println(fact(n))

}
