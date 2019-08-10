package main

import (
	"reflect"
	"testing"
)

func TestHeap(t *testing.T) {
	var result []int
	result = HeapSort([]int{3, 2, 1, 8, 7})
	if !reflect.DeepEqual(result, []int{1, 2, 3, 7, 8}) {
		t.Error("result should be 1,2,3,7,8 but was", result)
	}

	result = HeapSort([]int{3, 5, 1, 1, 1})
	if !reflect.DeepEqual(result, []int{1, 1, 1, 3, 5}) {
		t.Error("result should be 1,1,1,3,5 but was", result)
	}

	result = HeapSort([]int{1})
	if !reflect.DeepEqual(result, []int{1}) {
		t.Error("result should be 1 but was", result)
	}
}
