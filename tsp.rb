require "pp"
require 'benchmark'
require "mathn"

# @spots = [
#   [1,1], [1,2], [2, 2], [2,1]
# ]

def distance a, b
  Math.rsqrt((a[0] - b[0])**2 + (a[1] - b[1])**2)
end

def total_distance spots
  spots.each_cons(2)
    .map { |a, b|
      cache_key = (a + b).join
      @distance_cache[cache_key]
    }.inject(0) { |total, distance|
      total += distance
    }
end

def cache_distance
  # permutation, combination
  @spots.permutation(2) do |a, b|
    cache_key = (a + b).join
    @distance_cache[cache_key] = distance a, b
  end
end

def two_opt spots
  temp_spots = spots.dup
  while true
    changed = false
    temp_spots.size.times do |i|
      spots_before_swap = temp_spots.dup
      spots_after_swap = temp_spots.dup
      # swap
      if i + 1 < spots.size
        tmp = spots_after_swap[i]
        spots_after_swap[i] = spots_after_swap[i+1]
        spots_after_swap[i+1] = tmp
      end

      before_swap = total_distance(spots_before_swap)
      after_swap = total_distance(spots_after_swap)

      if before_swap > after_swap
        # puts "#{before_swap} to #{after_swap}"
        temp_spots = spots_after_swap
        changed = true
      end
    end
    break if changed == false
  end
  temp_spots
end


@distance_cache = {}

1.upto(5) do |i|
  puts "--- #{i * 100} ---"
  @spots = (i * 100).times.map {[rand(10), rand(20)]}
  puts Benchmark.measure {
    cache_distance
    optimized_spots = two_opt @spots
    pp total_distance optimized_spots
  }
end
