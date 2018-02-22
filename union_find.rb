require 'pp'

class UnionFind
  attr_accessor :forest, :ranks
  def initialize
    @forest = {}
    @ranks = {}
  end
  
  # It means find parent for node.
  def find(node)
    if @forest[node].nil?
      @forest[node] = node
      return node
    end

    while @forest[node] != node
      node = @forest[node]
    end
    node
  end

  def union(node1, node2)
    root1 = find node1
    root2 = find node2

    # it means they are in the same tree.
    return false if root1 == root2

    # init the rank
    @ranks[root1] ||= 0
    @ranks[root2] ||= 0

    if @ranks[root1] > @ranks[root2]
      @forest[root2] = root1
      @ranks[root1] += 1
    elsif @ranks[root1] < @ranks[root2]
      @forest[root1] = root2
      @ranks[root2] += 1
    else
      @forest[root2] = root1
      @ranks[root1] += 1
    end
  end
end

edges = [[1,2], [2,3], [3,4], [1,4], [1,5]]

union_find = UnionFind.new
merge_results = []
edges.each do |edge|
  if !union_find.union *edge
    merge_results << edge
  end
end
pp merge_results.last