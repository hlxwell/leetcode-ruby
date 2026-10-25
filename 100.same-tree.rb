require_relative "lib/tree_helper"
require 'pp'

def is_same_tree(node1, node2)
  return true if node1.nil? && node2.nil?
  return false if !node1.nil? && node2.nil?
  return false if node1.nil? && !node2.nil?
  return false if node1.val != node2.val

  is_same_tree(node1.left, node2.left) && is_same_tree(node1.right, node2.right)
end

[
  [
    [1,nil,1,nil,1],
    [1,nil,1,nil,1]
  ], [
    [1,2],
    [1,nil,2]
  ]
].each do |test_data|
  t1 = arr_to_tree test_data.first
  t2 = arr_to_tree test_data.last

  pp is_same_tree t1, t2
end
