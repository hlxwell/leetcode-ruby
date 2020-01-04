#
# @lc app=leetcode id=12 lang=ruby
#
# [12] Integer to Roman
#

# @lc code=start
# @param {Integer} num
# @return {String}
def int_to_roman(num)
  @num_to_roman = {
    1 => "I",
    5 => "V",
    10 => "X",
    50 => "L",
    100 => "C",
    500 => "D",
    1000 => "M",
  }

  bit = 1
  result = []
  while (n = num % 10) && num > 0
    if n <= 3
      result.unshift @num_to_roman[1 * bit] * n
    elsif n == 4
      result.unshift @num_to_roman[1 * bit] + @num_to_roman[5 * bit]
    elsif n == 9
      result.unshift @num_to_roman[1 * bit] + @num_to_roman[10 * bit]
    elsif n >= 5
      result.unshift @num_to_roman[5 * bit] + @num_to_roman[1 * bit] * (n - 5)
    end
    num /= 10
    bit *= 10
  end
  result.join
end

# @lc code=end

puts int_to_roman 58
