require 'pp'

def judge_circle moves
  moves.count('U') == moves.count('D') && moves.count('L') == moves.count('R')
end

pp judge_circle "UDUDUDUDUDUDUDUDUDLRR"