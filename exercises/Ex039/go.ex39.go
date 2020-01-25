package main

import "fmt"

func getPerimeters() map[int]int {
	perimeters := make(map[int]int)
	for a := 1; a < 1000; a++ {
		for b := a + 1; b < 1000-a; b++ {
			for c := b + 1; c < 1000-a-b; c++ {
				if a*a+b*b == c*c {
					perimeter := a + b + c
					if _, ok := perimeters[perimeter]; ok {
						perimeters[perimeter]++
					} else {
						perimeters[perimeter] = 1
					}
				}
			}
		}
	}
	return perimeters
}

func main() {
	perimeters := getPerimeters()
	maxp := 0
	maxn := 0
	for k, v := range perimeters {
		if v > maxn {
			maxn = v
			maxp = k
		}
	}
	fmt.Println(maxp) // 840
}
