### wrong answer
# def largest_number(arr)
#   longest_length = arr.max.to_s.size
#   nums = []
#   arr.each do |n|
#     if n.to_s.size < longest_length
#       nums << [n, n.to_s + n.to_s[-1] * (longest_length - n.to_s.size)]
#     else
#       nums << [n, n.to_s]
#     end
#   end
#   nums.sort_by {|n| n[-1]}.map {|result| result[0].to_s }.reverse.join.to_i.to_s
# end

### brutal force
# def largest_number(arr)
#   arr.permutation(arr.size).to_a.map {|result| result.map(&:to_s).join }.max
# end

def largest_number(arr)
  result = arr.map(&:to_s).sort { |a, b| (b + a).to_i <=> (a + b).to_i }.join
  return result.to_i.to_s if result[0] == '0'
  result
end

puts largest_number [3,30,34,5,9]
puts largest_number [34323,3432]
puts largest_number [1,1,1,1,1,2,2,2,2,2]
puts largest_number [0, 0]