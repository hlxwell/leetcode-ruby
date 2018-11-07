@cache = {}

def cal_cache
  @cache[1] = "1"
  (2..30).to_a.each do |n|
    prev_num = @cache[n - 1]
    @cache[n] = say(prev_num)
  end
end

# [{1 => 2}, {2 => 1}]
def say(num)
  counter = []
  num.split("").each_with_index do |n, i|
    prev_counter = counter.last
    if prev_counter.nil? or prev_counter.last != n
      counter << [1, n]
    elsif prev_counter[1] == n
      counter[-1][0] += 1
    end
  end
  counter.join
end

def count_and_say(n)
  cal_cache()
  @cache[n]
end

puts count_and_say(5)
