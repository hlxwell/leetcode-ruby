### 贪婪算法
# pp get_max_value_for_capacity items2, 10
def get_max_value_for_capacity items, capacity
  items.sort! {|a, b| (b.last/b.first) <=> (a.last/a.first) } # sort by value

  left_capacity = capacity
  items.inject(0) do |total_value, item|
    if left_capacity >= item.first
      left_capacity -= item.first
      total_value += item.last
    else
      total_value
    end
  end
end

items = [[2,6],[2,3],[6,5],[5,4],[4,6]] # 给定总称重: 10, 最优值：15

puts get_max_value_for_capacity items, 10