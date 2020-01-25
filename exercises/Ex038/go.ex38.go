package main

import (
	"fmt"
	"math/big"
	"sort"
	"strconv"
	"strings"
)

func sortString(w string) string {
	s := strings.Split(w, "")
	sort.Strings(s)
	return strings.Join(s, "")
}

// returns pandigital value if ispandigital, 0 otherwise
func pandigital(x, n int) (*big.Int, error) {
	result := ""
	for i := 1; i <= n; i++ {
		result = result + strconv.Itoa(x*i)
		//results = append(results, strconv.Itoa(x*i))
	}

	zero := big.NewInt(0)
	pan := new(big.Int)
	_, err := fmt.Sscan(result, pan)

	if err != nil {
		return zero, err
	}

	result = sortString(result)
	if result == "123456789" {
		return pan, nil
	}
	return zero, nil
}

func maxpandigitaln(x int) (*big.Int, error) {
	panmax := big.NewInt(0)
	for n := 2; n <= 10; n++ {
		pan, err := pandigital(x, n)
		if err != nil {
			return panmax, err
		}

		if pan.Cmp(panmax) == 1 {
			panmax.Set(pan)
		}
	}
	return panmax, nil
}

func main() {
	//fmt.Println(pandigital(192, 3)) // 192384576 <nil>
	x := 98765
	maxpan := big.NewInt(0)
	for {
		if x <= 0 {
			break
		}
		maxpanx, err := maxpandigitaln(x)
		if err != nil {
			panic(err)
		}
		if maxpanx.Cmp(maxpan) == 1 {
			maxpan.Set(maxpanx)
		}
		x--
	}

	fmt.Println(maxpan) // 932,718,654
}
