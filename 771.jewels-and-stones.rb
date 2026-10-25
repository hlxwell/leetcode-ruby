require "pp"

j = "aA"
s = "aaAAAAbbAAbb"

def num_jewels_in_stones(j, s)
  s.scan(/[#{j}]/).size
end

pp num_jewels_in_stones j, s
