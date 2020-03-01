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
      result[prev_url] ||= { c: 0, sum: 0 }
      result[prev_url][:c] += 1
      result[prev_url][:sum] += $1.to_f
    end
  end

  result.to_a.sort { |a, b|
    (b[-1][:sum] / b[-1][:c]) <=> (a[-1][:sum] / a[-1][:c])
  }.take(k)
end

puts top_duration_requests "rails.log", 10
