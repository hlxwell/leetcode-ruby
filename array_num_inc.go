package main

import "fmt"

func incArrayNum(nums []int) []int {
	result := []int{}
	nums[len(nums)-1] += 1
	carry := false
	// 1. any carry?
	// 2. if bigger than 10 then carry to next digit
	// 3. add current num to result.
	for i := len(nums) - 1; i >= 0; i-- {
		num := nums[i]
		if carry {
			num += 1
		}
		carry = (num >= 10)
		result = append([]int{num % 10}, result...)
	}
	if carry {
		result = append([]int{1}, result...)
	}

	return result
}

func main() {
	nums := []int{1, 2, 3, 8}
	fmt.Println(incArrayNum(nums))

	nums = []int{1, 2, 3, 9}
	fmt.Println(incArrayNum(nums))

	nums = []int{9, 9}
	fmt.Println(incArrayNum(nums))
}
