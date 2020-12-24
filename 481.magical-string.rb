#
# @lc app=leetcode id=481 lang=ruby
#
# [481] Magical String
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def magical_string(n)
  return 0 if n == 0
  arr = [1,2,2]
  return 1 if n <= 3

  i = 2
  while arr.size < n
    next_num = arr[-1] == 1 ? 2 : 1
    arr[i].times do
      arr.push next_num
    end
    i += 1
  end
  arr.take(n).count {|i| i == 1}
end
# @lc code=end

