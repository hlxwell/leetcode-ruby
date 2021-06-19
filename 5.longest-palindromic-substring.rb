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

def longest_palindrome_dp(str)
  max_width = 0
  max_index = 0
  memo = [1] * str.size

  2.upto(str.size) do |width|
    0.upto(str.size - width) do |i|
      if width > 3
        memo[i] = width if str[i] == str[i+width-1] && memo[i+1] == width - 2
      else
        memo[i] = width if str[i] == str[i+width-1]
      end
    end
  end

  memo.each_with_index do |n, i|
    if n > max_width
      max_width = n
      max_index = i
    end
  end

  str[max_index..(max_index+max_width-1)]
end

# @lc code=end
