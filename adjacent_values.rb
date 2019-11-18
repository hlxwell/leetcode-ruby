def adjacent_value arr
    result = -1
    cache = {}
    arr.each_with_index do |item, i|
        cache[item] ||= []
        cache[item] << i
    end

    sorted_uniq_keys = cache.keys.sort

    0.upto(sorted_uniq_keys.size - 2) do |i|
        cache[sorted_uniq_keys[i]].each do |a|
            cache[sorted_uniq_keys[i + 1]].each do |b|
                if (a-b).abs > result
                    result = (a-b).abs
                end
            end
        end
    end
    result
end

puts adjacent_value [0,3,3,7,5,3,11,1] # => 7
puts adjacent_value [1,4,7,3,3,5] # => 4
