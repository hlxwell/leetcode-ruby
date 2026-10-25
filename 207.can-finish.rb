def can_finish(num_courses, prerequisites)
  @visiting_queue = []
  @visited = []
  @connections = Hash.new

  prerequisites.each do |pair|
    @connections[pair.last] ||= []
    @connections[pair.last] << pair.first
  end

  0.upto(prerequisites.size * 2 - 1) do |node|
    return false if !dfs(node)
  end
  true
end

def dfs node
  return true if @visited.include?(node)
  return false if @visiting_queue.include?(node) # loop
  @visiting_queue.push node
  (@connections[node] || []).each do |subnode|
    return false if !dfs(subnode)
  end
  @visited << @visiting_queue.pop
  true
end

p can_finish 3, [[1, 0], [2, 1]]