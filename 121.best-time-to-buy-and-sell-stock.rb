require "pp"
require 'benchmark'

# prices = [7, 1, 5, 3, 6, 4]
# prices = [7, 6, 4, 3, 1]
prices = [2, 4, 1]
# prices = [1, 4, 3, 5, 3]

def max_profit prices
  return 0 if prices.size == 0
  index_for_price = {}
  prices.each_with_index { |price, i| index_for_price[price] = i }
  sorted_prices = prices.sort {|a, b| b <=> a}
  result = 0
  sorted_prices.each do |price|
    min_price_before_current_price = prices[0..index_for_price[price]].min
    profit = price - min_price_before_current_price
    result = profit if profit > result
  end
  result
end

# puts Benchmark.measure {
#   puts max_profit prices
# }

def max_profit prices
  return 0 if prices.size == 0
  min_price = prices.first
  profit = 0
  prices.each do |price|
    min_price = [price, min_price].min
    profit = [profit, price - min_price].max
  end
  profit
end

puts Benchmark.measure {
  puts max_profit prices
}