#
# @lc app=leetcode id=58 lang=ruby
#
# [58] Length of Last Word
#

# @lc code=start
# @param {String} s
# @return {Integer}
def length_of_last_word(s)
  s.strip!
  return 0 if s.size == 0
  s.split(" ").last.size
end

def length_of_last_word_from_scratch(s)
  s.strip!
  count = 0
  (s.size - 1).downto(0) do |i|
    if s[i] != " "
      count += 1
    else
      break
    end
  end
  return count
end

# @lc code=end
