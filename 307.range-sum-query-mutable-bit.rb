require_relative 'lib/tree_helper'
require 'pp'

# NOTE: All the i = node index, has to start from 1
class FenwickTree
  attr :sums

  def initialize nodes
    @sums = [0] * nodes.size

    # build tree
    1.upto(nodes.size).each do |node_index|
      update node_index, nodes[node_index - 1]
    end
  end

  def update i, delta
    return if i < 1

    while i <= @sums.size
      @sums[i - 1] += delta
      i += lowbit(i)
    end
  end

  def query i
    result = 0
    while i > 0
      result += @sums[i - 1]
      i -= lowbit(i)
    end
    result
  end

  def query_range i, j
    query(j) - query(i - 1)
  end

  private

  def lowbit x
    x & (-x)
  end
end

tree_nodes = [0,9,5,7,3]
fenwick_tree = FenwickTree.new tree_nodes

pp fenwick_tree.query_range 1, 4
fenwick_tree.update(1, 2)
pp fenwick_tree.query_range 1, 4


