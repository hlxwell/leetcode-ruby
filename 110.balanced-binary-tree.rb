#
# @lc app=leetcode id=110 lang=ruby
#
# [110] Balanced Binary Tree
#

# @lc code=start
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# Balanced means:
# diff(Left Tree Max Depth, Right Tree Max Depth) <= 1
#
# @param {TreeNode} root
# @return {Boolean}
def is_balanced(root)
  return true if root.nil?
  (max_depth(root.left) - max_depth(root.right)).abs <= 1 &&
    is_balanced(root.left) && is_balanced(root.right)
end

def max_depth(node, depth = 1)
  return depth if node.nil?
  [max_depth(node.left, depth + 1), max_depth(node.right, depth + 1)].max
end

# @lc code=end
