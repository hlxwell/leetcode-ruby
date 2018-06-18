require_relative 'lib/linked_list_helper'

def reverse_linked_list root
  new_root = nil

  node = root
  while node
    new_node = node.clone
    new_node.next = new_root
    new_root = new_node

    node = node.next
  end

  new_root
end

head = arr_to_linked_list [1,2,3,4,5,6,7]
p reverse_linked_list head
