require "pp"

def self_dividing_numbers(left, right)
  left.upto(right).select do |n|
    nums = n.to_s.split('')
    nums.all? { |num| next if num.to_i == 0; n % num.to_i == 0 }
  end
end

pp self_dividing_numbers 1, 22
