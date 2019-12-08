// https://leetcode.com/problems/binary-tree-paths/
package main

import (
	"fmt"
)

type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

// Pre-Order Travesal
func binaryTreePaths1(root *TreeNode) []int {
	var stack = []*TreeNode{}
	var result = []int{}

	stack = append(stack, root)
	var node *TreeNode
	for len(stack) > 0 {
		node, stack = stack[0], stack[1:]
		result = append(result, node.Val)
		if node.Left != nil {
			stack = append(stack, node.Left)
		}

		if node.Right != nil {
			stack = append(stack, node.Right)
		}
	}
	return result
}

// In-Order Travesal
func binaryTreePaths2(root *TreeNode) []int {
	var stack = []*TreeNode{}
	var result = []int{}
	var current = root

	for current != nil || len(stack) > 0 {
		if current != nil {
			// if left not blank, go for it.
			stack = append(stack, current)
			current = current.Left
		} else {
			// if left is blank, then go back to prev root
			// and visit(root) == use it & remove from queue
			current = stack[len(stack)-1]        // go back to prev root
			stack = stack[:len(stack)-1]         // remove
			result = append(result, current.Val) // use it
			current = current.Right              // visit right nodes
		}
	}
	return result
}

// Post-Order Travesal
func binaryTreePaths3(root *TreeNode) []int {
	var stack = []*TreeNode{root}
	var result = []int{}
	var current *TreeNode

	for len(stack) > 0 {
		current = stack[len(stack)-1]

		// if it's last leaf node, print
		if current.Left == nil && current.Right == nil {
			result = append(result, current.Val)
			stack = stack[:len(stack)-1]
		}

		// push right, left to stack
		// and cut the parent relationship, after parent becomes to be leaf, it will be print
		if current.Right != nil {
			stack = append(stack, current.Right)
			current.Right = nil
		}

		if current.Left != nil {
			stack = append(stack, current.Left)
			current.Left = nil
		}
	}
	return result
}

// 1
// |\
// 2 3
//	 |\
//   4 5
func main() {
	root := &TreeNode{
		Val:  1,
		Left: &TreeNode{Val: 2},
		Right: &TreeNode{
			Val:   3,
			Left:  &TreeNode{Val: 4},
			Right: &TreeNode{Val: 5},
		},
	}
	fmt.Println(binaryTreePaths1(root)) // 1 2 3 4 5
	fmt.Println(binaryTreePaths2(root)) // 2 1 4 3 5
	fmt.Println(binaryTreePaths3(root)) // 2 4 5 3 1
}
