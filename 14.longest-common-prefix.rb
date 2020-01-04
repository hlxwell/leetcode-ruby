#
# @lc app=leetcode id=14 lang=ruby
#
# [14] Longest Common Prefix
#

# @lc code=start
# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return "" if strs.empty?
  return "" if strs.detect &:empty?

  str_i = strs.size - 1
  char_i = 0 # strs.map { |s| s.size }.min - 1
  finish = false
  result = []

  while true
    common_char = nil
    0.upto(str_i) do |j|
      if strs[j][char_i].nil?
        finish = true
        break
      end

      if common_char.nil?
        common_char = strs[j][char_i]
      elsif common_char != strs[j][char_i]
        return result.join
      end
    end
    break if finish
    result << strs.first[char_i]
    char_i += 1
  end
  result.join
end

# @lc code=end
