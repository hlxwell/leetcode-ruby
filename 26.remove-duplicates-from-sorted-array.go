package main

import "fmt"

func removeDuplicates(nums []int) int {
	i := 0
	for i+1 < len(nums) {
		if nums[i] == nums[i+1] {
			nums = append(nums[0:i+1], nums[i+2:len(nums)]...)
		} else {
			i++
		}
	}

	return len(nums)
}

func main() {
	testCases := [][]int{
		[]int{1, 1, 1, 3, 4, 5, 5},
		[]int{1, 1},
		[]int{1},
	}
	for _, nums := range testCases {
		fmt.Println(removeDuplicates(nums))
	}
}
