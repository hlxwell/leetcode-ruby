class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

def included_in_list? node, n
  while node
    return true if node.val == n
    node = node.next
  end
end

## Loop way
# def arr_to_linked_list arr
#   input_arr = arr.dup
#   nodes = []
#   while input_arr.size > 0
#     node = ListNode.new input_arr.shift
#     nodes.last.next = node if nodes.size > 0
#     nodes << node
#   end
#   nodes.first
# end

## Recursive way
def arr_to_linked_list arr, root = nil
  node = ListNode.new arr.shift
  root.next = node if root
  arr_to_linked_list arr, node if arr.size > 0
  node
end

def list_to_arr head
  node = head
  list = []
  while node
    list.push node.val
    node = node.next
  end
  list
end