package main

import "fmt"

// get the diagonal sum for a given number of layers
func getDiagsum(rows int) int {
	layers := (rows + 1) / 2
	diagsum := 1
	layerendValue := 1
	layer := 1

	for {
		if layer > layers {
			break
		}
		numbersInLayer := ((layer-1)*2-1)*4 + 4
		layerendValue += numbersInLayer         // 1, 9, 25, ...
		diagSteps := (layer * 2) - 2            // 0, 2, 4, ...
		topRight := layerendValue               // 1, 9, 25, ...
		topLeft := layerendValue - diagSteps    // 1, 7, 21, ...
		botLeft := layerendValue - diagSteps*2  // 1, 5, 17, ...
		botRight := layerendValue - diagSteps*3 // 1, 3, 13
		diagsum += (topRight + topLeft + botLeft + botRight)
		layer++
	}

	// remove the 1 at the middle of the spiral which we have added 4 times
	return diagsum - 4
}

func main() {
	fmt.Println(getDiagsum(1001)) // 669,171,001
}
