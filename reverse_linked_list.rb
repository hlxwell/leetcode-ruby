require_relative "lib/linked_list_helper"

def reverse_linked_list(root)
  return root if root.nil? or root.next.nil?
  current = root
  prev = nil
  post = current.next

  while current
    current.next = prev # point to prev
    break if post.nil?
    # shift, prev, current, post
    prev, current, post = current, post, post.next
  end
  current
end

head = arr_to_linked_list [1, 2, 3, 4, 5, 6, 7]
p reverse_linked_list(head)

