def reverse(x)
  result = nil
  num = []
  if x < 0
    num << '-'
    x = x.abs
  end

  while x > 0
    num << x % 10
    x /= 10
  end
  result = num.join.to_i
  return 0 if result >= (2**31-1) || result <= -(2**31-1)
  result
end

p reverse -120
p reverse 1534236469
p reverse 123