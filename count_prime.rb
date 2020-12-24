require 'benchmark'
require "pp"

def count_prime_slow n
  return 0 if n <= 2

  (3...n).step(2).count do |num|
    !(2...num).detect { |i| num % (i * 1.0) <= 0 }
  end + 1
end

def count_prime_fast n
  return 0 if n <= 2
  cache = Array.new n, true
  cache[0] = false
  cache[1] = false

  (2..n**(1.0/2)).each do |i|
    next if !cache[i]
    (i*i...n).step(i).each do |x|
      cache[x] = false
    end
  end

  cache.count {|b| b}
end

# Simple version
# https://hooyes.net/2016/08/javascript-prime-number/
def count_prime n
  return 0 if n <= 2
  cache = Array.new n, true
  cache[0] = false
  cache[1] = false

  (2..n).each do |i|
    next if !cache[i]
    (i...n).step(i).each do |x|
      next if x == i
      cache[x] = false # 当时素数的倍数的时候全部筛掉
    end
  end

  cache.count {|b| b}
end

puts Benchmark.measure { count_prime 50000 }
puts Benchmark.measure { count_prime_fast 50000 }
puts Benchmark.measure { count_prime_slow 50000 }
