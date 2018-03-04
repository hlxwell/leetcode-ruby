require 'pp'
require_relative 'lib/tree_helper'

heap = arr_to_tree [1,2,3,4,5,6,7]

#      1
#    2   3
# 4   5  6   7

def sort_heap root
  # 递归
  sort_heap(root.left) if root.left
  sort_heap(root.right) if root.right

  left_value = root.left && root.left.val
  right_value = root.right && root.right.val
  current_value = root.val
  vals = [current_value, left_value, right_value].compact
  return false if vals.size < 2 # 如果左右树为空直接返回

  # 排序
  case vals.max
  when left_value then
    tmp_val = root.val
    root.val = root.left.val
    root.left.val = tmp_val
    swaped = true
  when right_value then
    tmp_val = root.val
    root.val = root.right.val
    root.right.val = tmp_val
    swaped = true
  else
  end

  root
end

pp tree_to_str sort_heap heap
