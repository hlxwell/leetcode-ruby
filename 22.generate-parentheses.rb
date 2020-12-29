#
# @lc app=leetcode id=22 lang=ruby
#
# [22] Generate Parentheses
#

# @lc code=start
# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  patterns = {
    1 => ['()']
  }
  return patterns[n] if n < 2

  2.upto(n) do |i|
    patterns[i] ||= []
    0.upto(i-1) do |j|
      patterns[i] << (patterns[j] || ['']).map do |s|
        (patterns[i-j-1] || ['']).map do |tail|
          "(#{s})#{tail}"
        end
      end
    end
    patterns[i].flatten!
  end

  patterns[n]
end

# puts generate_parenthesis(5)
# @lc code=end
