package main

import (
	"fmt"
)

// Node is the tree node type
type Node struct {
	children []*Node
	value    rune
}

func buildTrie(chars []rune, node *Node) {
	if len(chars) == 0 {
		return
	}

	firstChar := chars[0]
	restChars := chars[1:]

	// find matching value child node
	var childNode *Node
	for _, child := range node.children {
		if child.value == firstChar {
			childNode = child
			break
		}
	}

	if childNode == nil {
		childNode = &Node{value: firstChar}
		node.children = append(node.children, childNode)
		buildTrie(restChars, childNode)
	}

	// finish all chars
	if len(restChars) > 0 {
		buildTrie(restChars, childNode)
	}
}

func findCommonPrefix(node *Node) string {
	var nodeValue string
	if node.value == 0 {
		nodeValue = ""
	} else {
		nodeValue = string(node.value)
	}

	if len(node.children) == 1 {
		return nodeValue + findCommonPrefix(node.children[0])
	}

	return nodeValue
}

func longestCommonPrefix(strs []string) string {
	root := &Node{}
	for _, str := range strs {
		buildTrie([]rune(str), root)
	}

	result := findCommonPrefix(root)
	shortestStr := result
	for _, str := range strs {
		if len(str) < len(shortestStr) {
			shortestStr = str
		}
	}

	if len(result) > len(shortestStr) {
		return shortestStr
	}

	return result
}

func main() {
	strs := []string{"flower", "flow", "f"}
	result := longestCommonPrefix(strs)
	fmt.Println(result)
}
