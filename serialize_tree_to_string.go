package main

import (
	"fmt"
	"strconv"
	"strings"
)

type Node struct {
	Val   int
	Left  *Node
	Right *Node
}

var treeRoot *Node

func init() {
	treeRoot = &Node{
		Val: 0,
		Left: &Node{
			Val:  1,
			Left: &Node{Val: 3},
			Right: &Node{
				Val: 4,
				Left: &Node{
					Val: 5,
				},
				Right: &Node{
					Val: 6,
				},
			},
		},
		Right: &Node{
			Val:   2,
			Left:  &Node{Val: 5},
			Right: &Node{Val: 6},
		},
	}
}

func serialize(root *Node) string {
	var result string
	nodeValues := make(map[int]int)
	var maxKey int

	dfs(0, root, nodeValues)
	for key := range nodeValues {
		if key > maxKey {
			maxKey = key
		}
	}

	for i := 0; i <= maxKey; i++ {
		if val, ok := nodeValues[i]; ok {
			result = result + strconv.Itoa(val) + ","
		} else {
			result = result + ","
		}
	}

	return result[0 : len(result)-1] // remove last comma
}

func dfs(parentIndex int, node *Node, nodeValues map[int]int) {
	leftLeafIndex := parentIndex*2 + 1
	rightLeafIndex := parentIndex*2 + 2
	nodeValues[parentIndex] = node.Val

	if node.Left != nil {
		nodeValues[leftLeafIndex] = node.Left.Val
		dfs(leftLeafIndex, node.Left, nodeValues)
	}

	if node.Right != nil {
		nodeValues[rightLeafIndex] = node.Right.Val
		dfs(rightLeafIndex, node.Right, nodeValues)
	}
}

func deserialize(nums string) *Node {
	numsArr := strings.Split(nums, ",")
	if len(numsArr) == 0 {
		return nil
	}
	firstElement, err := strconv.Atoi(numsArr[0])
	if err != nil {
		return nil
	}
	numsArr = numsArr[1:]
	node := &Node{Val: firstElement}
	bfs(node, numsArr)
	return node
}

func bfs(root *Node, elements []string) {
	queue := []*Node{root}
	var node *Node
	var leftVal, rightVal string

	for len(queue) > 0 && len(elements) > 0 {
		// dequeue
		node = queue[0]
		queue = queue[1:]

		if len(elements) >= 2 {
			leftVal, rightVal = elements[0], elements[1]
			elements = elements[2:]
		} else {
			leftVal = elements[0]
			elements = elements[1:]
		}

		if leftVal != "" {
			val, _ := strconv.Atoi(leftVal)
			node.Left = &Node{Val: val}
			queue = append(queue, node.Left)
		} else {
			queue = append(queue, &Node{Val: 0})
		}

		if rightVal != "" {
			val, _ := strconv.Atoi(rightVal)
			node.Right = &Node{Val: val}
			queue = append(queue, node.Right)
		} else {
			queue = append(queue, &Node{Val: 0})
		}
	}
}

func main() {
	result := serialize(treeRoot)
	fmt.Println(result)
	fmt.Println(serialize(deserialize(result)))
}
