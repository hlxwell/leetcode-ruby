def my_sqrt(x)
  return 0 if x.nil? || x == 0
  return 1 if x == 1
  
  result = (0).upto(x).detect do |n|
      n ** 2 > x
  end
  result - 1
end

p my_sqrt 100