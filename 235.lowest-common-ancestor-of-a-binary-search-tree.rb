require_relative "lib/tree_helper"

# Binary Search Tree. left < Root < right

def lowest_common_ancestor(node, p, q)
  return lowest_common_ancestor(node.left, p, q) if node.left && p.val < node.val && q.val < node.val
  return lowest_common_ancestor(node.right, p, q) if node.right && p.val > node.val && q.val > node.val
  node.val
end

root = arr_to_tree [3,2,4,1,5,2,6,0,2]
a = root.left.left.left
b = root.left.left.right
p lowest_common_ancestor root, a, b
