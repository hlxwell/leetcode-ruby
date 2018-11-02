package main

import "fmt"

func MaxSubArray(nums []int) []int {
	var (
		max        = 0
		prev       = 0
		startIndex = 0
		endIndex   = 0
	)

	for i, num := range nums {
		if (num + prev) > num {
			prev = num + prev
			endIndex = i
		} else {
			startIndex = i
			prev = num
		}

		if max < prev {
			max = prev
		}
	}

	fmt.Println("Max Value:", max)
	return nums[startIndex:endIndex]
}

func main() {
	arr := []int{-1, 9, -3, 6, -5}
	subarr := MaxSubArray(arr)
	fmt.Println(subarr)
}
