#
# @lc app=leetcode id=17 lang=ruby
#
# [17] Letter Combinations of a Phone Number
#

# @lc code=start
# @param {String} digits
# @return {String[]}
NUM_TO_LETTERS = {
  '1': [],
  '2': %w[a b c],
  '3': %w[d e f],
  '4': %w[g h i],
  '5': %w[j k l],
  '6': %w[m n o],
  '7': %w[p q r s],
  '8': %w[t u v],
  '9': %w[w x y z],
  '0': %w[],
  '*': %w[],
  '#': %w[]
}

def letter_combinations(digits)
  letters = digits.split('').map { |n| NUM_TO_LETTERS[n.to_sym] }
  combination letters[0], letters[1..-1]
end

def combination arr, groups = []
  return [] if arr.nil? or arr.size == 0
  return arr if groups.nil? or groups.size == 0

  result = []
  arr.each do |c|
    combination(groups[0], groups[1..-1]).each do |rest|
      result << "#{c}#{rest}"
    end
  end
  result
end

# @lc code=end

