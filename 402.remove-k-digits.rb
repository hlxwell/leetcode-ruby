def remove_kdigits(num, k)
  return "0" if num.size == k
  return num if num.size == 0

  stack = []
  num.each_char do |n|
    if stack.empty?
      stack.push(n)
    else
      while !stack.empty? && stack.last > n && k > 0
        stack.pop
        k -= 1
      end

      stack.push(n)
    end
  end

  stack.pop(k) # remove the last k elements
  stack.shift while stack.first == '0' # remove leading zeros
  stack.empty? ? '0' : stack.join
end

puts remove_kdigits("1432219", 1)
puts remove_kdigits("112", 1)
puts remove_kdigits("1234567890", 9)
puts remove_kdigits("10200", 1)
puts remove_kdigits("100", 1)
