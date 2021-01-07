def remove_brackets str
  stack = []
  tmp_stack = []

  str.each_char do |c|
    if c == '('
      stack.push c
    elsif c == ')' and stack.last == '('
      stack.pop
      if stack.last != '('
        stack += tmp_stack
        tmp_stack = []
      end
    elsif c == ')' and stack.last != '('
      stack.push c
    elsif stack.last == '('
      tmp_stack.push c
    else
      stack.push c
    end
  end

  stack.join
end

puts remove_brackets '1(a)b(c(d)e)f)'
puts remove_brackets '1(a)b(c(d())ef)'