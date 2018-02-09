require 'pp'

# F[col, row] = F[(col-Weight-i), (row-1)] + Value-i
# F[8, a] = F[(8-Wa)=6, (a-1)=b] + Va

def knapsack_solver items, capacity
  matrix = Array.new(items.size) { Array.new(capacity, 0) } # Init matrix
  0.upto(capacity - 1) do |col| # row
    bag_capacity = col + 1
    0.upto(items.size - 1) do |row| # col
      current_item_weight = items[row].first
      current_item_value = items[row].last
      # 如果有基数值
      if (col - current_item_weight >= 0) and (row - 1 >= 0)
        matrix[row][col] = [
          matrix[row - 1][col - current_item_weight] + current_item_value,
          matrix[row - 1][col]
        ].max # 跟上一个最大值做比较
      else
        # 看看是否能够把新的当前 item 装进来，并且比上一行数据大。
        if bag_capacity >= current_item_weight && current_item_value > matrix[row - 1][col]
          matrix[row][col] = current_item_value
        else # 否则就取上一行的数据。
          matrix[row][col] = matrix[row - 1][col]
        end
      end
    end
  end
  matrix
end

# 二位数组的思考i, j的时候，脑子最好想成行和列会比较容易思考。
# [weight, value]
# items = [[2,13], [1,10], [3, 24], [2, 15], [4, 28], [5, 33], [3, 20], [1, 8]] # 给定总称重: 12, 最优值：90
items = [[2,6],[2,3],[6,5],[5,4],[4,6]].reverse # 给定总称重: 12, 最优值：17
knapsack_solver(items, 10).reverse.each_with_index do |item, i|
  puts "#{items[i].inspect} - #{item.inspect}"
end

