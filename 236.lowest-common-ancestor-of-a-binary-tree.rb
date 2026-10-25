require_relative "lib/tree_helper"

def lowest_common_ancestor(root, p, q)
  @result = nil
  dfs root, p, q
  @result
end

def dfs node, p, q
  in_left = in_right = in_self = false
  in_self = [p, q].include?(node)

  in_left = dfs(node.left, p, q) if node.left
  in_right = dfs(node.right, p, q) if node.right

  @result = node.val if in_left && in_right || in_left && in_self || in_right && in_self
  in_self || in_left || in_right
end

root = arr_to_tree [37,-34,-48,nil,-100,-100,48,nil,nil,nil,nil,-54,nil,-71,-22,nil,nil,nil,8]
a = root.right.left
b = root.right.right.left

p lowest_common_ancestor root, a, b
