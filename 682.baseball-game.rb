# ops = ["5","2","C","D","+"]

ops = ["-60","D","-36","30","13","C","C","-33"]

def cal_points(ops)
  stack = []
  ops.each do |op|
    if op == 'C'
      stack.pop
    elsif op == 'D'
      stack << stack[-1] * 2
    elsif op == '+'
      stack << stack[-2] + stack[-1]
    else
      stack << op.to_i
    end
  end
  stack.reduce(:+)
end

p cal_points ops
