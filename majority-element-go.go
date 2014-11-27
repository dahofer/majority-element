package main

import (
        "flag"
	"fmt"
	"io/ioutil"
	"log"
	"strings"
)

func parseFile(filename string) []string {
	line_bytes, err := ioutil.ReadFile(filename)
	if err != nil {
		log.Fatal(err)
	}

	line := string(line_bytes)
	clean_line := strings.Trim(line, "\n")
	return strings.Split(clean_line, ",")
}

func getCounts(elements []string) map[string]int {
	counts := make(map[string]int)
	for _, element := range elements {
		_, present := counts[element]
		if present {
			counts[element]++
		} else {
			counts[element] = 1
		}
	}
	return counts
}

func naiveMajorityElement(elements []string) {
	counts := getCounts(elements)
	for k, v := range counts {
		if v > len(elements) / 2 {
			fmt.Println(k)
			return
		}
	}
	fmt.Println(nil)
}

var inputFile = flag.String("input-file", "input.txt", "input file")

func main() {
        flag.Parse()

	elements := parseFile(*inputFile)
	naiveMajorityElement(elements)
}
