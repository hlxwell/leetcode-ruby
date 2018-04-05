MORSE_CODES = Hash[('a'..'z').to_a.zip([".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."])]

def unique_morse_representations(words)
  results = {}
  words.each do |word|
    morse_code = ""
    word.each_char do |char|
      morse_code << MORSE_CODES[char]
    end
    results[morse_code] = 1
  end
  results.keys.size
end

words = ["gin", "zen", "gig", "msg"]
p unique_morse_representations words # => 2