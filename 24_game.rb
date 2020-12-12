require 'bigdecimal'

def judge_point24(nums)
  raise "Wrong num of nums" if nums.size != 4

  ops = %w{+ - * /}
  nums.permutation(4).each do |arr|
    ops.each do |op1|
      ops.each do |op2|
        ops.each do |op3|
          r = []

          begin
            r << eval("(BigDecimal(#{arr[0]})#{op1}BigDecimal(#{arr[1]})) #{op2}BigDecimal(#{arr[2]})#{op3}BigDecimal(#{arr[3]})")
          rescue
          end

          begin
            r << eval("BigDecimal(#{arr[0]})#{op1} (BigDecimal(#{arr[1]})#{op2}BigDecimal(#{arr[2]})) #{op3}BigDecimal(#{arr[3]})")
          rescue
          end

          begin
            r << eval("BigDecimal(#{arr[0]})#{op1}BigDecimal(#{arr[1]})#{op2} (BigDecimal(#{arr[2]})#{op3}BigDecimal(#{arr[3]}))")
          rescue
          end

          begin
            r << eval("(BigDecimal(#{arr[0]})#{op1}BigDecimal(#{arr[1]})) #{op2} (BigDecimal(#{arr[2]})#{op3}BigDecimal(#{arr[3]}))")
          rescue
          end

          begin
            r << eval("(BigDecimal(#{arr[0]})#{op1}BigDecimal(#{arr[1]})#{op2}BigDecimal(#{arr[2]})) #{op3}BigDecimal(#{arr[3]})")
          rescue
          end

          begin
            r << eval("BigDecimal(#{arr[0]})#{op1}(BigDecimal(#{arr[1]})#{op2}BigDecimal(#{arr[2]})#{op3}BigDecimal(#{arr[3]}))")
          rescue
          end

          return true if r.select {|i| (i > 23.9 and i < 24.0) or i == 24 }.size > 0
          # return true if r.include? 24
        end
      end
    end
  end

  false
end

pp true == judge_point24([4,1,8,7])
pp true == judge_point24([1,9,1,2])
pp false == judge_point24([1,2,1,2])
pp true == judge_point24([3,9,7,7])
pp true == judge_point24([8,1,6,6])
pp true == judge_point24([1,1,9,6])
pp false == judge_point24([3,4,6,7])
pp true == judge_point24([3,3,8,8])
pp true == judge_point24([3,3,7,7])
