require 'pp'
require_relative 'lib/tree_helper'

tree = arr_to_tree [1,2,3,4,5,6,7]

#      1
#    2   3
# 4   5  6   7

def invert_tree root
  temp_pointer = root.left
  root.left = root.right
  root.right = temp_pointer

  invert_tree(root.left) if root.left
  invert_tree(root.right) if root.right
  root
end

pp tree_to_str invert_tree tree
