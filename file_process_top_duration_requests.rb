def top_duration_requests(filename, k = 10)
  result = {}
  prev_url = nil
  start_line_pattern = /^Started \w+ \"(.+)\" .+$/
  end_line_pattern = /^Completed .+ in (.+)ms .*$/

  f = File.open(filename)
  f.each_line do |line|
    if line.match(start_line_pattern)
      prev_url = $1
    elsif line.match(end_line_pattern)
      result[prev_url] ||= []
      result[prev_url] << $1.to_f
    end
  end

  result.to_a.sort { |a, b|
    avg(b.last) <=> avg(a.last)
  }.take(k)
end

def avg(arr)
  return 0 if !arr.is_a? Array or arr.size == 0
  arr.sum / arr.size
end

puts top_duration_requests "rails.log", 10
