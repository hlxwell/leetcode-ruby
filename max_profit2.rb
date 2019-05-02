prices = [9,1,10,2,4,1,5,10,2]

# prices = [1,2]

# def max_profit(prices)
#   return 0 if prices.size <= 1
#   bought_price = nil
#   profit = 0
#   0.upto(prices.size - 2) do |current_pointer|
#     next_pointer = current_pointer + 1
#     current_price = prices[current_pointer]
#     next_price = prices[next_pointer]

#     if current_price <= next_price && bought_price.nil?
#       bought_price = current_price
#     elsif current_price > next_price && !bought_price.nil?
#       profit += (current_price - bought_price)
#       bought_price = nil
#     end
#   end  
#   profit += prices.last - bought_price if !bought_price.nil?
#   profit
# end

def max_profit prices
  profit = 0
  0.upto(prices.size - 2) do |current_pointer|
    next_pointer = current_pointer + 1
    diff = prices[next_pointer] - prices[current_pointer]
    profit += diff > 0 ? diff : 0
  end
  profit
end

puts max_profit prices