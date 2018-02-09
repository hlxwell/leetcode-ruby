# encoding:utf-8
# ruby1.9是用ASCII编码来读源码的, http://zires.info/2011/03/17/invalid-multibyte-char-us-ascii-ruby1-9/

class KnapSack
  attr_accessor :weight, :value

  def initialize(weight, value)
    @weight = weight
    @value = value
  end

  def to_s
    "{weight:#{weight}, value:#{value}}"
  end
end

class KnapsackProblem
  attr_writer :bags, :total_weight
  attr_reader :bags, :total_weight, :best_value, :best_values, :best_solutions

  def initialize(bags, total_weight)
    @bags = bags
    @total_weight = total_weight
    @n = bags.length
    @best_values = Array.new(@n + 1) { Array.new(@total_weight + 1) }
    @best_solutions = Array.new
  end

  def solve
    puts '给定背包:'
    bags.each do |bag|
      puts bag.to_s
    end

    puts '给定总称重: ' + @total_weight.to_s

    (0..@total_weight).each do |j|
      (0..@n).each do |i|
        if i == 0 || j == 0
          @best_values[i][j] = 0
        else
          if j < @bags[i - 1].weight
            @best_values[i][j] = @best_values[i - 1][j]
          else
            iweight = @bags[i - 1].weight
            ivalue = @bags[i - 1].value
            @best_values[i][j] = [@best_values[i - 1][j], ivalue + @best_values[i - 1][j - iweight]].max
          end
        end
      end
    end

    temp_weight = @total_weight
    @n.downto(1).each do |i|
      if @best_values[i][temp_weight] > @best_values[i - 1][temp_weight]
        @best_solutions.push(@bags[i - 1])
        temp_weight -= @bags[i - 1].weight
        if temp_weight == 0
          break
        end
      end
      @best_value = @best_values[@n][@total_weight]
    end
  end
end

require "test/unit"
class TestKnapSack < Test::Unit::TestCase
  def test_solve
    bags = [KnapSack.new(2, 13), KnapSack.new(1, 10), KnapSack.new(3, 24), KnapSack.new(2, 15),
            KnapSack.new(4, 28), KnapSack.new(5, 33), KnapSack.new(3, 20), KnapSack.new(1, 8)]
    total_weight = 12
    kp = KnapsackProblem.new(bags, total_weight)
    kp.solve
    puts " -------- 该背包问题实例的解: --------- "
    puts "最优值：#{kp.best_value}"
    puts "最优解【选取的背包】: "
    print kp.best_solutions, "\n"
    puts "最优值矩阵："
    best_values = kp.best_values
    best_values.each  do |r|
      r.each do |c|
        printf("%-5d", c)
      end
      puts
    end
  end
end