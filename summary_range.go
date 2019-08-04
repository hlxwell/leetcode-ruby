package main

import (
	"fmt"
	"strconv"
)

func summaryRanges(nums []int) []string {
	if len(nums) == 0 {
		return []string{}
	}

	if len(nums) == 1 {
		return []string{strconv.Itoa(nums[0])}
	}

	result := []string{}
	buckets := [][]int{[]int{nums[0]}}
	var lastBucket []int
	var lastNum int

	for i := 1; i < len(nums); i++ {
		lastBucket = buckets[len(buckets)-1]
		lastNum = lastBucket[len(lastBucket)-1]

		if nums[i] == lastNum+1 {
			lastBucket = append(lastBucket, nums[i])
			buckets[len(buckets)-1] = lastBucket
		} else {
			buckets = append(buckets, []int{nums[i]})
		}
	}

	for _, bucket := range buckets {
		if len(bucket) == 1 {
			result = append(result, strconv.Itoa(bucket[0]))
		} else {
			firstNum := bucket[0]
			lastNum := bucket[len(bucket)-1]
			result = append(result, fmt.Sprintf("%d->%d", firstNum, lastNum))
		}
	}

	return result
}

func main() {
	fmt.Println(summaryRanges([]int{1, 2, 4, 5, 6, 7, 9}))
	fmt.Println(summaryRanges([]int{}))
	fmt.Println(summaryRanges([]int{1}))
}
