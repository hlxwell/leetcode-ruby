package main

import (
	"testing"
)

func TestLongestCommonPrefix1(t *testing.T) {
	strs := []string{"flower", "flow", "f"}
	result := longestCommonPrefix(strs)
	if result != "f" {
		t.Error("result should be f but", result)
	}
}

func TestLongestCommonPrefix2(t *testing.T) {
	strs := []string{"", "b"}
	result := longestCommonPrefix(strs)
	if result != "" {
		t.Error("result should be '' but", result)
	}
}

func TestLongestCommonPrefix3(t *testing.T) {
	strs := []string{"flower", "flow", "flash"}
	result := longestCommonPrefix(strs)
	if result != "fl" {
		t.Error("result should be fl but", result)
	}
}
