#
# @lc app=leetcode id=94 lang=ruby
#
# [94] Binary Tree Inorder Traversal
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
# @return {Integer[]}
def inorder_traversal(root)
  return [] if root.nil?
  @result = []
  dfs root
  @result
end

def dfs(node)
  dfs node.left if !node.left.nil?
  @result << node.val
  dfs node.right if !node.right.nil?
end

# @lc code=end
