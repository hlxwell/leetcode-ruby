package main

import (
	"testing"
)

func TestShortestWordDistance1(t *testing.T) {
	result := ShortestWordDistance1([]string{"a", "b", "c", "d", "b", "d"}, "b", "d")
	if result != 1 {
		t.Error("expected 1 but was ", result)
	}
}

func TestShortestWordDistance2(t *testing.T) {
	result := ShortestWordDistance2([]string{"a", "b", "c", "d", "b", "d"}, "b", "d")
	if result != 1 {
		t.Error("expected 1 but was ", result)
	}
}
