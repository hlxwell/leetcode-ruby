# You are given large numbers of logs,
# each one of which contains a start time (long), end time (long) and memory usage (int).
# The time is recorded as MMDDHH (100317 means October 3rd 5PM) Write an algorithm that returns
# a specific time (hour) when the memory usage is the highest.
# If there are multiple answers, return the first hour.

# e.g.
# 100207 100208 2
# 100305 100307 5
# 100207 100209 4
# 111515 121212 1
# Answer: 100207

def highest_mem(log)
  result = [0, 0]
  cache = {}
  log.each_line do |line|
    start_at, end_at, usage = line.split(" ")
    start_at.upto(end_at) do |t|
      cache[t] ||= 0
      cache[t] += usage.to_i
    end
  end
  cache.each do |k, v|
    if v > result.last
      result = [k, v]
    end
  end
  result
end

data = "100207 100208 2
100305 100307 5
100207 100209 4
111515 121212 1"

puts highest_mem data
