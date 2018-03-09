def climb_stairs(n)
  cache = {}
  cache[1] = 1
  cache[2] = 2
  3.upto(n) do |i|
    cache[i] = cache[i-1] + cache[i-2]
  end
  cache[n]
end

p climb_stairs 3