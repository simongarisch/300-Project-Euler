package main

import (
	"fmt"
	"sort"
	"strconv"

	prmt "github.com/gitchander/permutation"
)

func sliceToNumber(slice []string) (int, error) {
	numStr := ""
	for _, item := range slice {
		numStr += item
	}

	return strconv.Atoi(numStr)
}

func main() {
	numbers := "0123456789"
	var chars []string
	for _, num := range numbers {
		chars = append(chars, string(num))
	}

	var perms []int
	gen := prmt.New(prmt.StringSlice(chars))
	for gen.Next() {
		num, err := sliceToNumber(chars)
		if err != nil {
			panic(err)
		}
		perms = append(perms, num)
	}

	sort.Ints(perms)
	fmt.Println(perms[1e6-1]) // 2,783,915,460
}
