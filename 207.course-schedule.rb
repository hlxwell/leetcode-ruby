#
# @lc app=leetcode id=207 lang=ruby
#
# [207] Course Schedule
#


# @lc code=start
# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
### Solution 1
def can_finish_slow(num_courses, prerequisites)
  adj = {}
  visited = {}
  courses = prerequisites.flatten.uniq

  return true if prerequisites.size.zero?

  courses.each do |c|
    visited[c] = false
    adj[c] = []
  end

  # build the adjacency list
  prerequisites.each do |c|
    adj[c.first] << c.last
  end

  loop do
    tmp = adj.map do |course, deps|
      course if deps.empty?
    end.compact

    break if tmp.size.zero?

    tmp.each do |course|
      # update visited
      visited[course] = true
      adj.delete course

      # remove from deps
      adj.each do |k, v|
        adj[k] = v - [course]
      end
    end
  end

  visited.values.all? { |v| v == true }
end

### Solution 2
def can_finish(num_courses, prerequisites)
end

# @lc code=end

# puts can_finish 3, [[1,2], [1,3], [3,2], [2,4]]
# puts can_finish 1, [[1,2], [2,1]]
# puts can_finish 5, [[1,4],[2,4],[3,1],[3,2]]
