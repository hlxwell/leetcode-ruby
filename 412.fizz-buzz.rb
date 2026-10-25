require 'pp'

def fizz_buzz n
  result = []
  1.upto(n).each do |i|
    if i % 15 == 0
      result << "fizzbuzz"
    elsif i % 3 == 0
      result << "fizz"
    elsif i % 5 == 0
      result << "buzz"
    else
      result << i.to_s
    end
  end
  result
end

pp fizz_buzz 15