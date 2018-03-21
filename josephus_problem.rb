require_relative 'lib/linked_list_helper'

def get_lucky_number(total, k)
  queue_root = build_loop_linked_list(total)
  i = 1
  while true
    if i % k == k - 1
      # kill = prev point to next
      queue_root.next = queue_root.next.next
    else
      queue_root = queue_root.next
    end

    i += 1
    return queue_root.val if queue_root.next == queue_root
  end
end

def build_loop_linked_list total
  queue_root = ListNode.new 1
  prev_node = queue_root
  2.upto(total) do |i|
    node = ListNode.new i
    prev_node.next = node
    prev_node = node
    # after prev node moved to last
    prev_node.next = queue_root if i == total
  end
  queue_root
end

# 1, 2, (0), 1, 2, (0), 1, 2
# 1, 2,  3,  4, 5,  6,  7, 8
p get_lucky_number 8, 3 # => 7
