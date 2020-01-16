package main

import "fmt"

func indexOf(value int, intSlice []int) int {
	for i := 0; i < len(intSlice); i++ {
		if intSlice[i] == value {
			return i
		}
	}
	return -1 // not found
}

func countRemaindersFound(remaindersFound map[int]bool) int {
	count := 0
	for _, value := range remaindersFound {
		if value == true {
			count++
		}
	}
	return count
}

func main() {
	longestPattern := 0 // the longest recurring cycle
	longestDivisor := 0 // for a particular divisor

	for i := 2; i < 1000; i++ {
		n := 1           // numerator to be divided by
		var result []int // track the result of our division

		remaindersFound := make(map[int]bool)
		for j := 1; j < i; j++ {
			remaindersFound[j] = false
		}
		patternLength := 0
		patternFound := false

		for {
			if n == 0 {
				break
			}

			n *= 10         // go to the next significant figure
			wholes := n / i // get the number of times n is evenly divisible by i
			n = n % i       // continue with division for the remainder
			result = append(result, wholes)

			if n == 0 {
				break
			}

			// check if we have seen this remainder before
			if remaindersFound[n] {
				if !patternFound {
					idx1 := indexOf(wholes, result)
					idx2 := len(result)
					patternLength = idx2 - idx1 - 1

					if patternLength == 0 {
						count := countRemaindersFound(remaindersFound)
						if count == 1 {
							patternLength = 1
						}
					}

					if patternLength > longestPattern {
						longestPattern = patternLength
						longestDivisor = i
					}
					patternFound = true
				}
			}

			remaindersFound[n] = true
			if patternFound && len(result) > 15 {
				break
			}
		}
	}

	fmt.Println(longestDivisor) // 983
}
