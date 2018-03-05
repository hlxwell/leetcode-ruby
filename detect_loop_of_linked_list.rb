require_relative "lib/linked_list_helper"

# loop the node
def loop_the_linked_list head
  node = head
  while node
    if node.next.nil?
      node.next = head
      break
    end
    node = node.next
  end
  head
end

def is_loop? head
  slow = head
  return false if slow.next.nil?
  fast = slow.next

  while fast
    return true if slow == fast

    # slow pointer move 1 step
    slow = slow.next

    # fast pointer move 2 steps
    return false if fast.next.nil?
    fast = fast.next
    fast = fast.next if !fast.next.nil?
  end
  false
end

head1 = loop_the_linked_list arr_to_linked_list([1,2,3,4,5,6,7])
head2 = arr_to_linked_list [1,2,3,4,5,6,7]

p is_loop? head1
p is_loop? head2