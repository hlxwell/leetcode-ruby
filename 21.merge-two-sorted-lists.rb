#
# @lc app=leetcode id=21 lang=ruby
#
# [21] Merge Two Sorted Lists
#

# @lc code=start
# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val, next_node = nil)
    @val = val
    @next = next_node
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  head = ListNode.new(0)
  tail = head
  smaller_val = nil
  while l1 and l2
    if l1.val > l2.val
      smaller_val = l2.val
      l2 = l2.next
    else
      smaller_val = l1.val
      l1 = l1.next
    end

    tail.next = ListNode.new(smaller_val)
    tail = tail.next
  end

  tail.next = l1 if l1
  tail.next = l2 if l2
  head.next
end

# @lc code=end

a = ListNode.new(1, ListNode.new(2, ListNode.new(4)))
b = ListNode.new(1, ListNode.new(3, ListNode.new(5)))
puts merge_two_lists(a, b).inspect
