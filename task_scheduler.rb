require 'pp'

# 知识点: 如何统计 group_by 以后算出 group size
# tasks.inject(Hash.new(0)) { |h, task| h[task] += 1 ; h }

def least_interval tasks, n
  return tasks.size if n == 0
  task_count_group = tasks.inject(Hash.new(0)) { |h, task| h[task] += 1 ; h }

  task_counts = task_count_group.values
  top_frequent_task_frequency = task_counts.max
  top_frequent_task_count = task_counts.count {|c| c == top_frequent_task_frequency}
  uniq_task_count = task_counts.size
  slot_size = n + 1

  [
    (top_frequent_task_frequency - 1) * slot_size + top_frequent_task_count,
    tasks.size
  ].max
end

tasks = %w{a a b c} # n1 = 1, result = 7

## 最佳组合
# => a b, a b
#
# 算出来是3个周期, 那么不可能比实际周期还短
# (2 - 1) * 2 + 1 = 1 * 2 + 1 = 3
#
# 实际需要4个周期
# a a b c = 4

pp least_interval tasks, n = 1


