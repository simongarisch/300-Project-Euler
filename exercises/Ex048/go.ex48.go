package main

import (
	"fmt"
	"math/big"
	"strconv"
)

func main() {
	one := big.NewInt(1)
	current := big.NewInt(1)
	stop := big.NewInt(1000)

	totsum := big.NewInt(0)
	for {
		if current.Cmp(stop) >= 0 {
			break
		}

		var toAdd = new(big.Int)
		toAdd.Exp(current, current, nil)

		totsum.Add(totsum, toAdd)
		current.Add(current, one)
	}

	totsumstr := totsum.String()
	lastTenDigits, err := strconv.Atoi(totsumstr[len(totsumstr)-10:])
	if err != nil {
		panic(err)
	}
	fmt.Println(lastTenDigits) // 9,110,846,700
}
