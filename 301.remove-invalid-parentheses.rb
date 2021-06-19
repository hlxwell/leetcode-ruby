#
# @lc app=leetcode id=301 lang=ruby
#
# [301] Remove Invalid Parentheses
#

# @lc code=start
# @param {String} s
# @return {String[]}
def remove_invalid_parentheses(s)
  left_count = s.count('(')
  right_count = s.count(')')
  brackets_to_remove = left_count - right_count
  remove_pair = brackets_to_remove > 0 ? '(' : ')'

  return valid_backet(s) if brackets_to_remove == 0

  result = []

  0.upto(s.size - 1) do |i|
    if s[i] == remove_pair
      new_s = s[0..i] + s[i+1..-1]
      if brackets_to_remove == 1
        result << new_s if valid_backet(new_s)
      elsif brackets_to_remove > 1
        result += remove_invalid_parentheses(new_s)
      end
    end
  end
  result
end

def valid_bracket str
  stack = []
  str.each_char do |c|
    stack.push c if c == '('
    if c == ')' and stack.last == '('
      stack.pop
    elsif c == ')' and stack.last != '('
      return false
    end
  end
  stack.size == 0
end
# @lc code=end

pp remove_invalid_parentheses '()())()'
