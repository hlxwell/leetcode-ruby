#
# @lc app=leetcode id=1249 lang=ruby
#
# [1249] Minimum Remove to Make Valid Parentheses
#

# @lc code=start
# @param {String} s
# @return {String}
def min_remove_to_make_valid(s)
  str = s.split('').select {|c|
    c == '(' or c == ')'
  }
  brackets_to_remove = remove_valid str.join
  pp brackets_to_remove
end

def remove_valid str
  stack = []
  str.each_char do |c|
    stack.push c if c == '('
    if c == ')' and stack.last == '('
      stack.pop
    elsif c == ')' and stack.last != '('
      stack.push ')'
    end
  end
  stack
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

# min_remove_to_make_valid "lee(t(c)o)de)"
min_remove_to_make_valid "))(()"
