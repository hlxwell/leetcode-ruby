package main

import (
	"fmt"
)

type ListNode struct {
	Val  int
	Next *ListNode
}

func isPalindrome(head *ListNode) bool {
	var nums = []int{}
	var node = head
	for node != nil {
		nums = append(nums, node.Val)
		node = node.Next
	}

	loopCount := len(nums) / 2
	for i := 0; i < loopCount; i++ {
		if nums[i] != nums[len(nums)-1-i] {
			return false
		}
	}

	return true
}

func main() {
	d := &ListNode{Val: 1}
	c := &ListNode{Val: 2, Next: d}
	b := &ListNode{Val: 2, Next: c}
	a := &ListNode{Val: 1, Next: b}

	result := isPalindrome(a)
	fmt.Println(result)
}
