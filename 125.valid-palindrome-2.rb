# https://leetcode.com/problems/valid-palindrome-ii/

# 8 / 2 == 4 (0..7) left mid == 3 (4-1)
# 9 / 2 == 4 (0..8) left mid == 3 (4-1)
def valid_palindrome(s)
  return false if s.empty?

  0.upto(s.size / 2 - 1) do |i|
    next if s[i] == s[s.size - 1 - i]
    new_s = s[(i + 1)..(s.size - 1 - i)] # move left == right?
    return true if new_s == new_s.reverse
    new_s = s[i..(s.size - 1 - i - 1)] # move right == left
    return true if new_s == new_s.reverse
    return false
  end
  true
end

def valid_palindrome_slow(s)
  0.upto(s.size - 1) do |i|
    return true if is_palindrome(s[0...i] + s[i + 1..-1])
  end
  false
end

# 8 / 2 == 4 (0..7) left mid == 3
# 9 / 2 == 4 (0..8) left mid == 4
def is_palindrome(str)
  return false if str.empty?
  0.upto(str.size / 2) do |i|
    return false if str[i] != str[-i - 1]
  end
  return true
end

# puts is_palindrome("") == false
# puts is_palindrome("a") == true
# puts is_palindrome("aa") == true
# puts is_palindrome("aba") == true
# puts is_palindrome("abba") == true
# puts is_palindrome("asdfs") == false

puts valid_palindrome("abcdefg") == false
puts valid_palindrome("abbac") == true
puts valid_palindrome("caba") == true
puts valid_palindrome("acba") == true
puts valid_palindrome("cuucu") == true
