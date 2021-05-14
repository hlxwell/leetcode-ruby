#
# @lc app=leetcode id=134 lang=ruby
#
# [134] Gas Station
#

# @lc code=start
# @param {Integer[]} gas
# @param {Integer[]} cost
# @return {Integer}
def can_complete_circuit(gas, cost)
  return -1 if gas.size != cost.size
  return -1 if gas.sum < cost.sum

  loop_size = gas.size
  current_gas = 0
  0.upto(loop_size - 1) do |i|
    next if gas[i] < cost[i]

    j = i
    current_gas = 0
    loop do
      return i if (j - i) == loop_size

      current_station = j % loop_size
      current_gas += gas[current_station]
      # puts "j: #{j}, current_gas: #{current_gas}. cur: #{current_station}"
      current_gas -= cost[current_station]
      j += 1

    break if current_gas.negative?
    end
  end
  -1
end

# puts can_complete_circuit([1, 2, 3, 4, 5], [3, 4, 5, 1, 2])
# puts can_complete_circuit([3, 3, 4], [3, 4, 4])
# puts can_complete_circuit([5, 1, 2, 3, 4], [4, 4, 1, 5, 1])
# puts can_complete_circuit([2], [2])

# @lc code=end
