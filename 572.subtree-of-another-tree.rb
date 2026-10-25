require 'pp'
require './lib/tree_helper'

def is_subtree(s, t)
  return false if s.nil? or t.nil?
  return true if s.nil? && t.nil?

  is_node_equal?(s, t) or
    is_subtree(s.left, t) or
    is_subtree(s.right, t)
end

def is_node_equal? a, b
  return true if a.nil? and b.nil?
  return false if a.nil? or b.nil?

  a.val == b.val and is_node_equal?(a.left, b.left) and is_node_equal?(a.right, b.right)
end

# = Test Code =============================================
#     3
#    / \
#   4   5
#  / \
# 1   2
#    /
#   0

[
  [
    [1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,2],
    [1,nil,1,nil,1,2]
  ], [
    [3,4,5,1,2,nil,nil,nil,nil,0],
    [4,1,2,nil,nil,0]
  ]
].each do |test_data|
  t1 = arr_to_tree test_data.first
  t2 = arr_to_tree test_data.last

  # pp lnr_traverse_tree t1
  pp tree_to_str t1

  pp is_subtree t1, t2
end
