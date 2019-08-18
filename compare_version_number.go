package main

import (
	"fmt"
	"strconv"
	"strings"
)

var resultToString map[int]string

func init() {
	resultToString = map[int]string{
		-1: "<",
		1:  ">",
		0:  "==",
	}
}

func compareVersion(version1 string, version2 string) int {
	// return err if version is not valid string or numbers
	var result, v1Num, v2Num int
	v1Nums := []int{}
	v2Nums := []int{}

	for _, num := range strings.Split(version1, ".") {
		if n, err := strconv.Atoi(num); err == nil {
			v1Nums = append(v1Nums, n)
		}
	}

	for _, num := range strings.Split(version2, ".") {
		if n, err := strconv.Atoi(num); err == nil {
			v2Nums = append(v2Nums, n)
		}
	}

	i := 0
	for i < len(v1Nums) || i < len(v2Nums) {
		if len(v1Nums) > i {
			v1Num = v1Nums[i]
		} else {
			v1Num = 0
		}

		if len(v2Nums) > i {
			v2Num = v2Nums[i]
		} else {
			v2Num = 0
		}

		if v1Num > v2Num {
			result = 1
			break
		} else if v1Num < v2Num {
			result = -1
			break
		} else {
			result = 0
		}

		i++
	}

	return result
}

func main() {
	fmt.Println(resultToString[compareVersion("7.5.2.4", "7.5.3")])
	fmt.Println(resultToString[compareVersion("1.01", "1.001")])
	fmt.Println(resultToString[compareVersion("1.0", "1.0.0")])
}
