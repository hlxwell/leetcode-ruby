#
# @lc app=leetcode id=71 lang=ruby
#
# [71] Simplify Path
#

# @lc code=start
# @param {String} path
# @return {String}
def simplify_path(path)
  stack = []
  path.split("/").each do |e|
    next if e.empty? || e == "."
    if e == ".."
      stack.pop
    else
      stack.push e
    end
  end

  "/" + stack.join("/")
end

# @lc code=end

puts simplify_path("/a//b////c/d//././/..") == "/a/b/c"
puts simplify_path("/a/../../b/../c//.//") == "/c"
