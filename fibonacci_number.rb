# n.  Xn = Xn-1 + Xn-2
# ...
# 5. 5 = 3 + 2
# 4. 3 = 2 + 1
# 3. 2 = 1 + 1
# 2. 1 = 0 + 1
# 1. 0

def fibonacci nth
  return 0 if nth == 1
  return 1 if nth == 2

  fibonacci(nth - 1) + fibonacci(nth - 2)
end

p fibonacci 10
