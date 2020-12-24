#
# @lc app=leetcode id=204 lang=ruby
#
# [204] Count Primes
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def count_primes(n)
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
# @lc code=end
