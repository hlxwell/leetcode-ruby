# => "ababcbaca", "defegde", "hijhklij"
# => [9,7,8]

str = "ababcbacadefegdehijhklij"

def partition_labels(str)
  result = []
  last_appear_index = {}
  chars = str.split('')
  latest_last_appear_index = first_appear_index = 0
  chars.each_with_index { |c, i| last_appear_index[c] = i }
  chars.each_with_index do |c, i|
    latest_last_appear_index = [last_appear_index[c], latest_last_appear_index].max
    if i == latest_last_appear_index
      result << i - first_appear_index + 1
      first_appear_index += result.last
    end
  end
  result
end

p partition_labels str
