require "set"
require "benchmark"

def find_similar_word_count1(word, word_list)
  return 0 if word.nil? or word.size == 0 or word_list.nil? or word_list.size == 0
  result = 0
  word_dict = {}
  word_list.uniq.each do |w| # O(2n)
    fingerprint = w.chars.uniq.sort.join # O(nlogn + 2n)
    word_dict[fingerprint] ||= []
    word_dict[fingerprint] << w
  end

  word_fingerprint = word.chars.uniq.sort.join # O(nlogn + 2n)
  matched_words = word_dict[word_fingerprint]
  result = matched_words.size if !matched_words.nil?
  result
end

def find_similar_word_count2(word, word_list)
  return 0 if word.nil? or word.size == 0 or word_list.nil? or word_list.size == 0
  result = 0
  word_fingerprint = Set.new(word.chars)
  # word_set = Set.new word_list # this is very slow
  word_list.uniq.each do |w| # O(2n)
    result += 1 if word_fingerprint == Set.new(w.chars)
  end
  result
end

puts find_similar_word_count1 "love", %w{velo low vole lovee volvell lowly lower lover levo loved love lovee lowe lowes lovey lowan lowa evolve loves volvelle lowed love}
puts find_similar_word_count1 "god", %w{good dog god}

puts Benchmark.measure {
  10.times do
    find_similar_word_count1 "love", %w{velo low vole lovee volvell lowly lower lover levo loved love lovee lowe lowes lovey lowan lowa evolve loves volvelle lowed love} * 1000
  end
}

puts Benchmark.measure {
  10.times do
    find_similar_word_count2 "love", %w{velo low vole lovee volvell lowly lower lover levo loved love lovee lowe lowes lovey lowan lowa evolve loves volvelle lowed love} * 1000
  end
}
