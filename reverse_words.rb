def reverse_words(s)
    words = s.split(" ")
    words.compact!
    words.map &:strip
    words.reverse!
    words.join ' '
end

def reverse_words s
  s.split(" ").compact.map {|w| w.strip}.reverse.join ' '
end

puts reverse_words "   a b!   cccc    "
