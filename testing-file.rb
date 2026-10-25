# def longest_palindromic_substring(s)
#   return s if s.size == 1

#   max_length = 1
#   str = s[0]

#   # 处理奇数长度的回文串
#   1.upto(s.size - 1) do |i|
#     max_width = [i, s.size - i - 1].min
#     next if max_width == 0

#     1.upto(max_width) do |j|
#       if s[i-j] == s[i+j]
#         result = j * 2 + 1
#         if result > max_length
#           max_length = result
#           str = s[i-j..i+j]
#         end
#       else
#         break
#       end
#     end
#   end

#   # 处理偶数长度的回文串
#   0.upto(s.size - 2) do |i|
#     next if s[i] != s[i+1]
#     max_width = [i, s.size - i - 2].min
#     next if max_width == 0

#     1.upto(max_width) do |j|
#       if s[i-j] == s[i+1+j]
#         result = j * 2 + 2
#         if result > max_length
#           max_length = result
#           str = s[i-j..i+1+j]
#         end
#       else
#         break
#       end
#     end
#   end

#   str
# end

# puts longest_palindromic_substring("babad")
# puts longest_palindromic_substring("cbbd")

@result = []
def permutation(arr, k)
  return [[]] if k == 0

  dfs(arr, k, [])
  @result
end

def dfs(arr, k, path)
  # finish condition
  if path.size == k
    @result << path
    return
  end

  # recursive
  arr.each do |i|
    dfs(arr - [i], k, path + [i])
  end
end

puts permutation([1, 2, 3], 2).inspect

# def combination(arr, k)
#   arr.combination(k).to_a
# end
# puts combination([1, 2, 3], 2).inspect
