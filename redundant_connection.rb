require 'pp'
require_relative 'lib/graph_helper'

# edges = [[3, 4],[1, 2],[2, 4],[3, 5],[2, 5]]
edges = [[1, 2], [2, 3], [3, 4], [1, 4], [1, 5]]

## Matrix
# [[0, 1, 0, 1, 1],
#  [0, 0, 1, 0, 0],
#  [0, 0, 0, 1, 0],
#  [0, 0, 0, 0, 0],
#  [0, 0, 0, 0, 0]]

## Adjacency list
# 1: [ 2 -> 4 -> 5 ]
# 2: [ 1 -> 3 ]
# 3: [ 2 -> 4 ]
# 4: [ 3 -> 1 ]
# 5: [ 1 ]

def find_redundant_connection(edges)
  graph = Hash.new

  edges.each do |a, b|
    # 检查是否造成回路 = 之前已经联通了 + 新的连线也能造成回路
    if graph[a] && dfs_check_if_connected(a, b, graph)
      return [a, b]
    end

    # memorize the connection
    graph[a] ||= []
    graph[b] ||= []
    graph[a].push b
    graph[b].push a
  end
end

def dfs_check_if_connected(start_node_id, end_node_id, graph, visited = {})
  return false if !visited[start_node_id].nil? # 如果访问过了就代表还没有找到。

  visited[start_node_id] = true
  return true if start_node_id == end_node_id

  # 遍历相邻的所有子节点
  graph[start_node_id].any? { |point_id| dfs_check_if_connected(point_id, end_node_id, graph, visited) }
end

pp find_redundant_connection edges

### test if connected
# graph = edges_to_adjacency_hash edges
# pp dfs_check_if_connected 1, 5, graph
