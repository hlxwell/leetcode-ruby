require "pp"

@keyboard_rows = {}
["qwertyuiop", "asdfghjkl", "zxcvbnm"].each_with_index do |row, index|
  row.split('').each do |w|
    @keyboard_rows[w] = index + 1
  end
end

def find_words words
  words.select do |word|
    downcased_word = word.downcase
    !downcased_word.split('').detect {|w|
      @keyboard_rows[w] != @keyboard_rows[downcased_word[0]]
    }
  end
end

pp find_words ["Hello", "Alaska", "Dad", "Peace"]