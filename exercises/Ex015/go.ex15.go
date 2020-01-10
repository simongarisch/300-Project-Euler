package main

import (
	"fmt"

	"gonum.org/v1/gonum/stat/combin"
)

const size = 20

func main() {
	combinations := combin.Binomial(2*size, size)
	fmt.Println(combinations) // 137,846,528,820
}
