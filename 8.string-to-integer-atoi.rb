#
# @lc app=leetcode id=8 lang=ruby
#
# [8] String to Integer (atoi)
#

# @lc code=start
# @param {String} str
# @return {Integer}
def my_atoi(str)
  r = str.to_i
  return -2147483648 if r <= -2147483648
  return 2147483647 if r >= 2147483647
  r
end

# @lc code=end
