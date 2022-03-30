# @param {String} num
# @return {Boolean}
def is_additive_number(num)
  return false if num.size < 3

  1.upto(num.size) do |n|
    1.upto(num.size - n) do |m|
      num1, num2 = num[0...n], num[n...n+m]
      next if !additive_number_with_initial_digits? num1, num2, num

      puts "first: #{num1}, second: #{num2}"
      return true
    end
  end

  false
end

def additive_number_with_initial_digits?(first, second, num)
  return false if first.size > 1 && first.start_with?('0')
  return false if second.size > 1 && second.start_with?('0')

  result = first.to_i + second.to_i
  new_num = "#{first}#{second}#{result}"
  return false if !num.start_with?(new_num)
  return true if new_num.size == num.size

  additive_number_with_initial_digits?(second, result.to_s, num[first.to_s.size..-1])
end

# puts is_additive_number('000')
# puts is_additive_number('10')
# puts is_additive_number('111')
# puts is_additive_number('1023')
# puts is_additive_number('101')
# puts is_additive_number('199100199')
# puts additive_number_with_initial_digits(1, 99, '199100199')
# puts additive_number_with_initial_digits?('0', '0', '000')
