require "pp"

class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

l1 = ListNode.new(2)
l1.next = ListNode.new(4)
l1.next.next = ListNode.new(3)

l2 = ListNode.new(5)
l2.next = ListNode.new(6)
l2.next.next = ListNode.new(4)

# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.

def add_two_numbers(l1, l2)
  l3 = nil

  l1_str = ""
  l = l1
  while !l.nil?
    l1_str << l.val.to_s
    l = l.next
  end

  l2_str = ""
  l = l2
  while !l.nil?
    l2_str << l.val.to_s
    l = l.next
  end

  result = l1_str.reverse.to_i + l2_str.reverse.to_i
  result.to_s.split('').reverse.each do |n|
    if l3 == nil
      l3 = ListNode.new(n)
    else
      l = l3
      while !l.nil?
        if l.next.nil?
          l.next = ListNode.new(n)
          break
        end
        l = l.next
      end
    end
  end
  l3
end

l3 = add_two_numbers l1, l2
l = l3
while !l.nil?
  puts l.val
  l = l.next
end


