#
# @lc app=leetcode id=231 lang=ruby
#
# [231] Power of Two
#

# @lc code=start
# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
  n.to_s(2) =~ /^10*$/ ? true : false
end

# @lc code=end
