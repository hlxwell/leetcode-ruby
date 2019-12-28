#
# @lc app=leetcode id=66 lang=ruby
#
# [66] Plus One
#

# @lc code=start
# @param {Integer[]} digits
# @return {Integer[]}
def plus_one1(digits)
  new_last_digit = (digits.last || 0) + 1
  result = nil
  if new_last_digit > 9
    new_last_digit %= 10
    result = plus_one(digits[0...-1])
    result.push new_last_digit
  else
    result = digits[0...-1]
    result.push new_last_digit
  end
  result
end

def plus_one(digits)
  (digits.join.to_i + 1).to_s.split("").map &:to_i
end

# @lc code=end
