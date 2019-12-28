#
# @lc app=leetcode id=101 lang=ruby
#
# [101] Symmetric Tree
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

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)
  return true if root.nil?
  is_same(root.left, root.right)
end

def is_same(left, right)
  return true if left.nil? and right.nil?
  return false if left.nil? or right.nil?

  left.val == right.val &&
    is_same(left.left, right.right) &&
    is_same(left.right, right.left)
end

# @lc code=end
