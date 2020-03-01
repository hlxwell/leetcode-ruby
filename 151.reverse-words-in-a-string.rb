#
# @lc app=leetcode id=151 lang=ruby
#
# [151] Reverse Words in a String
#

# @lc code=start
# @param {String} s
# @return {String}
def reverse_words(s)
  s.split(" ").compact.map { |w| w.strip }.reverse.join " "
end

def reverse_words_from_scratch(s)
  s.strip!
  words = []
  return "" if s.size == 0

  0.upto(s.size - 1) do |i|
    if s[i] != " "
      words.unshift "" if words.last.nil?
      words[0] << s[i] # new word
    elsif words.first != ""
      words.unshift ""
    end
  end
  words.join " "
end

# @lc code=end

puts reverse_words "   a b!   cccc    "
