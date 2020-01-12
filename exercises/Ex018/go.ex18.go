package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func getTriangle() ([][]int, error) {
	var triangle [][]int
	var lines []string

	file, err := os.Open("triangle.txt")
	if err != nil {
		return triangle, err
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	scanner.Split(bufio.ScanLines)

	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}

	for _, line := range lines {
		line = strings.Trim(line, " ")
		items := strings.Split(line, " ")
		numbers := []int{}
		for _, item := range items {
			number, err := strconv.Atoi(item)
			if err != nil {
				return triangle, err
			}
			numbers = append(numbers, number)
		}
		triangle = append(triangle, numbers)
	}

	return triangle, nil
}

func max(x, y int) int {
	if x > y {
		return x
	}
	return y
}

func main() {
	triangle, err := getTriangle()
	if err != nil {
		panic(err)
	}
	//fmt.Println(triangle)

	for irow := len(triangle) - 2; irow >= 0; irow-- {
		for index, value := range triangle[irow] {
			godown := value + triangle[irow+1][index]
			goright := value + triangle[irow+1][index+1]
			triangle[irow][index] = max(godown, goright)
		}
	}

	fmt.Println(triangle[0][0]) // 1,074
}
