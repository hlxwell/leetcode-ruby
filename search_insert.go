package main

import "fmt"

func main() {
	index := searchInsert([]int{1}, 1)
	fmt.Println(index)
}

func searchInsert(nums []int, target int) int {
	i := 0
	num_count := len(nums)

	if target > nums[num_count-1] {
		return num_count
	}

	if target <= nums[0] {
		return 0
	}

	for i < len(nums)-1 {
		if target == nums[i] {
			return i
		} else if target <= nums[i+1] {
			return i + 1
		}

		i++
	}

	return i + 1
}
