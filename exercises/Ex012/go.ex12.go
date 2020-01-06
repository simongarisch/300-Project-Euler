package main

import (
	"fmt"
	"math"
)

const targetFactors = 500

func main() {
	triangleNumber, numFactors, counter := 1, 1, 1

	for {
		counter++
		triangleNumber += counter
		numFactors = 2
		for i := 2; i < int(math.Sqrt(float64(triangleNumber))+1); i++ {
			if triangleNumber%i == 0 {
				if i*i == triangleNumber {
					numFactors++
				} else {
					numFactors += 2
				}
			}
		}
		if numFactors >= targetFactors {
			break
		}
	}

	fmt.Println(triangleNumber) // 76,576,500
}
