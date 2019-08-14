package main

import (
	"fmt"
	"sort"
	"strconv"
)

func threeSum(nums []int) [][]int {
	if len(nums) < 3 {
		return [][]int{}
	}
	sort.Ints(nums)
	result := make(map[string][]int)
	uniqResult := [][]int{}
	var key string
	var left, right, mid, sum int

	for left = 0; left < len(nums)-2; left++ {
		right = len(nums) - 1
		mid = left + 1

		for mid < right {
			sum = nums[mid] + nums[left] + nums[right]

			if sum > 0 {
				right--
			} else if sum < 0 {
				mid++
			} else {
				key = strconv.Itoa(nums[left]) + strconv.Itoa(nums[mid]) + strconv.Itoa(nums[right])
				result[key] = []int{nums[left], nums[mid], nums[right]}
				right--
				mid++
			}
		}
	}

	for _, val := range result {
		uniqResult = append(uniqResult, val)
	}

	return uniqResult
}

func main() {
	fmt.Println(threeSum([]int{-2, 0, 1, 1, 2}))
	// fmt.Println(threeSum([]int{-1, 0, 1, 2, -1, -4}))
	// fmt.Println(threeSum([]int{0, 0, 0}))
}
