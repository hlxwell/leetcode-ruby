package main

import (
	"fmt"
	"strconv"
)

type Node struct {
	val  int
	next *Node
	prev *Node
}

type LRUCache struct {
	cache     map[int]int
	queueHead *Node // old -> new
	queueTail *Node // new -> old
	capacity  int
}

func Constructor(capacity int) LRUCache {
	cache := make(map[int]int)
	return LRUCache{capacity: capacity, cache: cache}
}

func (this *LRUCache) updateLRUQueue(key int) {
	this.deleteFromLRUQueue(key)
	newNode := &Node{val: key}

	// blank queue
	if this.queueHead == nil {
		this.queueTail = newNode
		this.queueHead = newNode
	} else {
		newNode.prev = this.queueTail
		this.queueTail.next = newNode
		this.queueTail = newNode
	}
}

func (this *LRUCache) deleteFromLRUQueue(key int) {
	if this.queueHead.val == key {
		// if you are deleting the only one element
		if this.queueTail == this.queueHead {
			this.queueTail = nil
		}

		this.queueHead = this.queueHead.next

		return
	}

	// start from second node
	prevNode := this.queueHead
	currentNode := this.queueHead.next

	for currentNode != nil {
		if currentNode.val == key {
			prevNode.next = currentNode.next

			// if you are deleting tail
			if this.queueTail == currentNode {
				this.queueTail = currentNode.prev
			} else {
				currentNode.next.prev = prevNode
			}

			return
		}
		prevNode = currentNode
		currentNode = currentNode.next
	}
}

func (this *LRUCache) Get(key int) int {
	if val, ok := this.cache[key]; ok {
		this.updateLRUQueue(key) // update lru queue
		return val
	}

	return -1
}

func (this *LRUCache) Put(key int, value int) {
	// element exists then update value and the lru queue
	if _, ok := this.cache[key]; ok {
		this.updateLRUQueue(key)
		this.cache[key] = value
		return
	}

	// if not exist && over capacity then delete LRU element
	if len(this.cache) >= this.capacity {
		delete(this.cache, this.queueHead.val)
		this.queueHead = this.queueHead.next
	}

	// if not exist and not over capacity then add element to queue and cache
	this.cache[key] = value
	newNode := &Node{val: key}

	if this.queueHead == nil {
		this.queueHead = newNode
		this.queueTail = this.queueHead
	} else {
		this.queueTail.next = newNode
		newNode.prev = this.queueTail
		this.queueTail = newNode
	}
}

func (this LRUCache) printQueue() {
	node := this.queueHead
	str := ""
	for node != nil {
		str += strconv.Itoa(node.val)
		node = node.next
	}
	fmt.Println(str)
}

func main() {
	obj := Constructor(2)
	obj.Put(1, 1)
	obj.Put(2, 2)
	fmt.Println(obj.Get(1))
	obj.Put(3, 3)
	fmt.Println(obj.Get(2))
	obj.Put(4, 4)
	fmt.Println(obj.Get(1))
	fmt.Println(obj.Get(3))
	fmt.Println(obj.Get(4))

	// obj := Constructor(1)
	// obj.Put(2, 1)
	// fmt.Println(obj.Get(2))
	// obj.Put(3, 2)
	// fmt.Println(obj.Get(2))
	// fmt.Println(obj.Get(3))
}
