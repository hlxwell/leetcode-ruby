def palindrome(str)
  chars = str.split("")
  char_counter = {}
  chars.each do |char|
    char_counter[char] ||= 0
    char_counter[char] += 1
  end
  counters = char_counter.values.sort
  picked_max_singular = false
  counters.inject(0) do |sum, n|
    if n % 2 == 1 && !picked_max_singular
      picked_max_singular = true
      sum += n
    else
      sum += n - (n % 2)
    end
  end
end

puts palindrome "asdfghjkl" # => 7
