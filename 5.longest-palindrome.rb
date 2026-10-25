def longest_palindrome str
  result = str[0] || str
  0.upto(str.size - 1) do |i|
    if str.size - 1 >= i+1 and str[i] == str[i+1]
      max_width = [i, (str.size-i-2)].min
      0.upto(max_width) do |j|
        if str[i-j] == str[i+1+j]
          result = str[i-j..i+j+1] if (j+j+2) > result.size
        else
          break
        end
      end
    end

    max_width = [i, (str.size-i-1)].min
    1.upto(max_width) do |j|
      # left == right, size bigger than prev result
      if str[i-j] == str[i+j]
        result = str[i-j..i+j] if (j+j+1) > result.size
      else
        break
      end
    end
  end
  result
end

puts longest_palindrome "ababa"
puts longest_palindrome "baba"
puts longest_palindrome "abbac"
puts longest_palindrome "abcdefe"
puts longest_palindrome "abbc"
puts longest_palindrome "c"
puts longest_palindrome "cc"
puts longest_palindrome "ccc"
puts longest_palindrome "cccc"
puts longest_palindrome "cbabc"
puts longest_palindrome "abacab"
puts longest_palindrome ""
puts longest_palindrome "ababababa"
