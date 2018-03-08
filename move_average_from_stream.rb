class MovingAverage
  def initialize window_size
    @window_size = window_size
    @queue = []
  end

  def next(num)
    @queue.push num
    @queue.shift if @queue.size > @window_size
    total = @queue.inject(0) { |sum, n| sum += n }
    total / @queue.size
  end
end

m = MovingAverage.new(3)
p m.next(1) == 1
p m.next(10) == (1 + 10) / 2
p m.next(3) == (1 + 10 + 3) / 3
p m.next(5) == (10 + 3 + 5) / 3
