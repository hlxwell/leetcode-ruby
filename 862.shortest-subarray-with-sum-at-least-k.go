package main

import "fmt"

func shortestSubarray(arr []int, goal int) int {
	n := len(arr)

	var cachedSum []int
	for i, num := range arr {
		if i == 0 {
			cachedSum = append(cachedSum, arr[0])
		} else {
			cachedSum = append(cachedSum, cachedSum[i-1]+num)
		}
	}

	for subarrSize := 1; subarrSize <= n; subarrSize++ {
		for i := 0; n >= (i + subarrSize); i++ {
			sum := cachedSum[i+subarrSize-1]
			if i > 0 {
				sum -= cachedSum[i-1]
			}

			if sum >= goal {
				return subarrSize
			}
		}
	}

	return -1
}

func main() {
	arr := []int{48, 99, 37, 4, -31}
	fmt.Println(shortestSubarray(arr, 140))
}
