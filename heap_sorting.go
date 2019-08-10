package main

type Heap struct {
	data []int
}

func (heap *Heap) AddToHeap(num int) {
	heap.data = append(heap.data, num)

	lastItemIndex := len(heap.data) - 1
	heap.bottomToUpSort(lastItemIndex)
}

func (heap *Heap) bottomToUpSort(targetIndex int) {
	parentIndex := int((targetIndex - 1) / 2)
	if heap.data[parentIndex] > heap.data[targetIndex] {
		heap.swap(parentIndex, targetIndex)
		heap.bottomToUpSort(parentIndex)
	}
}

func (heap *Heap) topToBottomSort(targetIndex int) {
	if len(heap.data) == targetIndex+1 {
		return
	}

	// there is left leaf, and target bigger than left leaft, then swap
	if len(heap.data) > targetIndex+2 {
		if heap.data[targetIndex+1] > heap.data[targetIndex+2] {
			heap.swap(targetIndex, targetIndex+2)
			heap.topToBottomSort(targetIndex + 2)
		} else {
			heap.swap(targetIndex, targetIndex+1)
			heap.topToBottomSort(targetIndex + 1)
		}
	} else if len(heap.data) > targetIndex+1 {
		if heap.data[targetIndex] > heap.data[targetIndex+1] {
			heap.swap(targetIndex, targetIndex+1)
			heap.topToBottomSort(targetIndex + 1)
		}
	}
}

func (heap *Heap) PopFromHeap() int {
	var result int

	if len(heap.data) > 0 {
		result = heap.data[0]
		heap.data[0] = heap.data[len(heap.data)-1]
		heap.data = heap.data[:len(heap.data)-1]

		heap.topToBottomSort(0)
	}

	return result
}

func (heap *Heap) swap(from int, to int) {
	tmp := heap.data[from]
	heap.data[from] = heap.data[to]
	heap.data[to] = tmp
}

func HeapSort(nums []int) []int {
	heapTree := Heap{data: []int{}}
	result := []int{}

	for _, num := range nums {
		heapTree.AddToHeap(num)
	}

	for i := 0; i < len(nums); i++ {
		result = append(result, heapTree.PopFromHeap())
	}

	return result
}
