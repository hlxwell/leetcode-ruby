// https://leetcode.com/problems/binary-tree-paths/
package main

import "fmt"

type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

// Pre-Order Travesal
func binaryTreePaths1(root *TreeNode) []int {
	var result []int
	result = append(result, root.Val)
	if root.Left != nil {
		result = append(result, binaryTreePaths1(root.Left)...)
	}
	if root.Right != nil {
		result = append(result, binaryTreePaths1(root.Right)...)
	}
	return result
}

// In-Order Travesal
func binaryTreePaths2(root *TreeNode) []int {
	var result []int
	if root.Left != nil {
		result = append(result, binaryTreePaths2(root.Left)...)
	}
	result = append(result, root.Val)
	if root.Right != nil {
		result = append(result, binaryTreePaths2(root.Right)...)
	}
	return result
}

// Post-Order Travesal
func binaryTreePaths3(root *TreeNode) []int {
	var result []int
	if root.Left != nil {
		result = append(result, binaryTreePaths3(root.Left)...)
	}
	if root.Right != nil {
		result = append(result, binaryTreePaths3(root.Right)...)
	}
	result = append(result, root.Val)
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
