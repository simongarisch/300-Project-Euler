package main

import (
	"fmt"
	"sort"
	"strconv"

	prmt "github.com/gitchander/permutation"
)

const digits = "0123456789"

func intFromIndices(s string, i1, i2, i3, div int) (bool, error) {
	concat := string(s[i1]) + string(s[i2]) + string(s[i3])
	num, err := strconv.Atoi(concat)
	if err != nil {
		return false, err
	}

	if num%div != 0 {
		return false, nil
	}
	return true, nil
}

func hasProperty(x int) (bool, error) {
	s := strconv.Itoa(x)

	if len(s) != 10 {
		return false, nil
	}

	var check bool
	var err error
	check, err = intFromIndices(s, 1, 2, 3, 2)
	if check == false {
		return check, err
	}

	check, err = intFromIndices(s, 2, 3, 4, 3)
	if check == false {
		return check, err
	}

	check, err = intFromIndices(s, 3, 4, 5, 5)
	if check == false {
		return check, err
	}

	check, err = intFromIndices(s, 4, 5, 6, 7)
	if check == false {
		return check, err
	}

	check, err = intFromIndices(s, 5, 6, 7, 11)
	if check == false {
		return check, err
	}

	check, err = intFromIndices(s, 6, 7, 8, 13)
	if check == false {
		return check, err
	}

	check, err = intFromIndices(s, 7, 8, 9, 17)
	if check == false {
		return check, err
	}

	return true, err
}

func sliceToNumber(slice []string) (int, error) {
	numStr := ""
	for _, item := range slice {
		numStr += item
	}

	return strconv.Atoi(numStr)
}

func main() {
	//fmt.Println(hasProperty(1406357289)) // true <nil>
	sumpan := 0

	var chars []string
	for _, num := range digits {
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

	for _, perm := range perms {
		hasprop, err := hasProperty(perm)
		if err != nil {
			panic(err)
		}
		if hasprop {
			sumpan += perm
		}
	}

	fmt.Println(sumpan) // 16,695,334,890
}
