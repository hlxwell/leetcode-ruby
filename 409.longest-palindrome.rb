#
# @lc app=leetcode id=409 lang=ruby
#
# [409] Longest Palindrome
#

# @lc code=start
# @param {String} s
# @return {Integer}
def longest_palindrome(s)
  return 0 if s.empty?
  return 1 if s.size == 1

  result = 0
  dict = {}
  s.each_char do |c|
    dict[c] ||= 0
    dict[c] += 1
  end

  has_odd = false
  dict.values.each do |v|
    result += (v / 2 * 2)
    rest = v % 2
    has_odd = true if rest.odd?
  end
  result += 1 if has_odd

  result
end

# @lc code=end

puts longest_palindrome("abccccdd")
