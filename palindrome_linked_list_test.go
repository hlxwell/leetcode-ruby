package main

import "testing"

func TestIsPalindrome1(t *testing.T) {
	c := &ListNode{Val: 1}
	b := &ListNode{Val: 2, Next: c}
	a := &ListNode{Val: 1, Next: b}

	if !isPalindrome(a) {
		t.Error("121 => true")
	}
}

func TestIsPalindrome2(t *testing.T) {
	d := &ListNode{Val: 1}
	c := &ListNode{Val: 2, Next: d}
	b := &ListNode{Val: 2, Next: c}
	a := &ListNode{Val: 1, Next: b}

	if !isPalindrome(a) {
		t.Error("1221 => true")
	}
}

func TestIsPalindrome3(t *testing.T) {
	b := &ListNode{Val: 2}
	a := &ListNode{Val: 1, Next: b}

	if isPalindrome(a) {
		t.Error("12 => false")
	}
}
