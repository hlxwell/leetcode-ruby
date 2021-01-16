#
# @lc app=leetcode id=5 lang=ruby
#
# [5] Longest Palindromic Substring
#

# @lc code=start
# @param {String} s
# @return {String}
def longest_palindrome(s)
  result = ''
  i = 0
  while i < s.size
    width = 0
    k = i + 1
    while s[i] == s[k]
      width += 1
      k += 1
    end

    result = result.size > width + 1 ? result : s[i..(i+width)]
    j = 1
    while (i + j + width) <= (s.size - 1) and (i - j) >= 0
      if s[i-j] == s[i+j+width]
        str = s[(i-j)..(i+j+width)]
        result = result.size > str.size ? result : str
        j += 1
      else
        break
      end
    end
    i += 1
  end
  result
end

# pp longest_palindrome("aabaab")
# @lc code=end
