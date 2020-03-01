def most_frequent_ip(filename, k)
  result = {}
  f = File.open(filename)
  f.each_line do |line|
    ip = line.match(/^[^\s]+/).to_s
    result[ip] ||= 0
    result[ip] += 1
  end
  result.to_a.sort { |a, b| b.last <=> a.last }.take(k).map &:first
end

puts most_frequent_ip "nginx.access.log", 3
