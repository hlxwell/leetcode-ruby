package main

import "fmt"

func findPeakElement(nums []int) int {
	if len(nums) == 0 {
		return -1
	}

	max := nums[0]
	maxIndex := 0
	for i, num := range nums {
		if num > max {
			max = num
			maxIndex = i
		}
	}
	return maxIndex
}

func bFindPeakElement(nums []int) int {
	start := 0
	end := len(nums) - 1
	var mid int

	for start < end {
		mid = (end-start)/2 + start

		if nums[mid] > nums[mid+1] {
			end = mid
		} else {
			start = mid + 1
		}
	}

	return start
}

func main() {
	fmt.Println(bFindPeakElement([]int{1, 2, 3, 1}))          // 2
	fmt.Println(bFindPeakElement([]int{1, 2, 1, 3, 5, 6, 4})) // 5
}
