package main

import (
	"fmt"
	"io/ioutil"
	"sort"
	"strings"
)

func getNames() ([]string, error) {
	var names []string

	data, err := ioutil.ReadFile("names.txt")
	if err != nil {
		return names, err
	}

	cleanNames := strings.Replace(string(data), "\"", "", -1)
	names = strings.Split(cleanNames, ",")
	sort.Strings(names)
	fmt.Println(names)
	return names, nil
}

func main() {
	getNames()
}
