require 'pp'
require_relative "lib/tree_helper"

# BST就是左小右大的这个特点。

root = arr_to_tree [10,-2,6,8,-4,7,5] # [5,2,10]

def convert_bst(root)
  @sum = 0
  set_greater_node root
  root
end

def set_greater_node node
  return if node.nil?

  # 递归左树
  set_greater_node node.right if node.right

  # 处理当前节点
  node.val += @sum
  @sum = node.val

  # 递归右树
  set_greater_node node.left if node.left
end

pp tree_to_str convert_bst(root)
