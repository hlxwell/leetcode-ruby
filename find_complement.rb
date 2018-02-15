# 101 => 5
# 101 ^ 111 = 010 = 2

def find_complement(num)
  bit_length = num.to_s(2).size
  (2 ** bit_length - 1) ^ num
end

puts find_complement 5 # => 2
