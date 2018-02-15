require 'pp'
require "benchmark"
require_relative "lib/tree_helper"

class NumArray
  attr :root

  def initialize(nums)
    return nil if nums.nil? || nums.size == 0
    @nums = nums
    @root = build_tree @nums
  end

  def update(i, val)
    @nums[i] = val
    update_node @root, i..i, val
  end

  def sum_range(i, j)
    sum_range_in_tree @root, i, j
  end

  private

  def update_node node, update_range, val
    node_range = node.range

    if node_range == update_range || (update_range.first <= node_range.first && update_range.last >= node_range.last) # 完全包含相等，返回 val
      node.val = val
      return node.val
    elsif update_range.last >= node_range.first && update_range.first <= node_range.last # 部分重叠，往下迭代
      a = update_node(node.left, update_range, val)
      b = update_node(node.right, update_range, val)
      node.val = a + b
      return node.val
    elsif update_range.last < node_range.first or update_range.first > node_range.last # 完全不包含，返回 Float::INFINITY
      return node.val
    else
      raise "WFT?"
    end
  end

  def sum_range_in_tree node, i, j
    return 0 if node.nil?

    node_range = node.range
    sum_num_range = (i..j)

    if node_range == sum_num_range || (i <= node_range.first && j >= node_range.last) # 完全包含相等，返回 val
      return node.val
    elsif sum_num_range.last >= node_range.first && sum_num_range.first <= node_range.last # 部分重叠，往下迭代
      a = sum_range_in_tree(node.left, i, j)
      b = sum_range_in_tree(node.right, i, j)
      return a + b
    elsif sum_num_range.last < node_range.first or sum_num_range.first > node_range.last # 完全不包含，返回 Float::INFINITY
      return 0
    else
      raise "WFT?"
    end
  end

  ### divide_num 先写实例需求，在找规律
  # 2 0,0 : 1,1 => 0 = (2 / 2.0).ceil - 1
  # 3 0,1 : 2,2 => 1 = (3 / 2.0).ceil - 1
  # 4 0,1 : 2,3 => 1 = (4 / 2.0).ceil - 1
  # 5 0,2 : 3:4 => 2 = (5 / 2.0).ceil - 1
  #
  def build_tree nums, range = nil
    arr_size = nums.size
    range = 0..(nums.size - 1) if range.nil?

    return TreeNodeWithRange.new(nums.first, range) if arr_size == 1

    divide_num         = (arr_size / 2.0).ceil - 1
    left_tree_range    = range.first..(range.first + divide_num)
    right_tree_range   = (range.first + divide_num + 1)..range.last

    node = TreeNodeWithRange.new(nums.inject(0) {|total, n| total += n}, range)
    node.left = build_tree nums[0..divide_num], left_tree_range
    node.right = build_tree nums[(divide_num + 1)..(arr_size - 1)], right_tree_range
    node
  end
end

# Your NumArray object will be instantiated and called as such:
@obj = NumArray.new([0,9,5,7,3])

pp @obj.sum_range(4, 4)
@obj.update(1, 2)
pp @obj.sum_range(2, 4)
pp @obj.sum_range(3, 3)
