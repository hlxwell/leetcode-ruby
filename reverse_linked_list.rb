require_relative "lib/linked_list_helper"

def reverse_linked_list(root)
  prev_node = new_head = nil
  node = root
  while node
    next_node = node.next
    node.next = prev_node
    prev_node = node
    new_head = node if next_node.nil? # detect if it's last node
    node = next_node
  end
  new_head
end

head = arr_to_linked_list [1, 2, 3, 4, 5, 6, 7]
p reverse_linked_list(head)
