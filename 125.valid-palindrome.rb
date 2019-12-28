#
# @lc app=leetcode id=125 lang=ruby
#
# [125] Valid Palindrome
#

# @lc code=start
# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  return true if s.empty?
  s.gsub!(/[^\d\w]+/, "")
  s = s.downcase
  0.upto(s.size / 2) do |i|
    return false if s[i] != s[s.size - 1 - i]
  end
  true
end

# @lc code=end

# puts is_palindrome("A man, a plan, a canal: Panama")
