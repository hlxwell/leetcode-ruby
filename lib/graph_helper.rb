class Vertex
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

def edges_to_adjacency_hash edges
  adjacency_list = {}
  reversed_edges = edges.map {|edge| edge.reverse }
  (edges + reversed_edges).each do |edge|
    adjacency_list[edge.first] ||= []
    adjacency_list[edge.first].push edge.last
  end
  adjacency_list
end

def edges_to_adjacency_list edges
  adjacency_list = {}
  reversed_edges = edges.map {|edge| edge.reverse }
  (edges + reversed_edges).each do |edge|
    last_node = adjacency_list[edge.first]

    if last_node.nil?
      adjacency_list[edge.first] = Vertex.new edge.last
    else
      while last_node
        if last_node.next.nil?
          last_node.next = Vertex.new edge.last
          break
        end
        last_node = last_node.next
      end
    end
  end
  adjacency_list
end

def edges_to_adjacency_matrix edges
  matrix_size = edges.flatten.max
  matrix = Array.new(matrix_size) { Array.new(matrix_size, 0) }
  edges.each do |edge|
    matrix[edge.first - 1][edge.last - 1] = 1
    matrix[edge.last - 1][edge.first - 1] = 1
  end
  matrix
end