# in-place reverse a string
def reverse_string(s)
  0.upto(s.size / 2 - 1) do |i|
    s[i], s[-i - 1] = s[-i - 1], s[i]
  end
  s
end

s = "a b  cd efg"
reverse_string s
puts s

