def solve_n_queens(n)
  @n = n
  @solutions = []
  dfs [], 0
  @solutions.map { |coord| convert_coords_to_map(coord) }
end

def dfs tmp, y
  return if y > @n - 1

  0.upto(@n-1) do |x|
    new_tmp = tmp + [[x, y]]
    next if has_fight?(@n, tmp, x, y)
    @solutions << new_tmp if y == @n - 1
    dfs new_tmp, y + 1
  end
end

# same x or y, (x-x1).abs == (y-y1).abs
# data[y][x]
def has_fight?(n, queens, x, y)
  data = Array.new(n) { Array.new(n, '.') }
  queens.each {|coord| data[coord[1]][coord[0]] = 'Q' }

  return true if data[y].include?('Q') # same y
  return true if data.detect { |row| row[x] == 'Q' } # same x

  1.upto(x) do |i|
    return true if y-i >= 0 && data[y-i][x-i] == 'Q'
    return true if y + i <= n - 1 && data[y+i][x-i] == 'Q'
  end

  1.upto(n-1-x) do |i|
    return true if y-i >= 0 && data[y-i][x+i] == 'Q'
    return true if y + i <= n - 1 && data[y+i][x+i] == 'Q'
  end

  false
end

def convert_coords_to_map(coords, n = nil)
  n ||= coords.size
  matrix = Array.new(n) { '.' * n }
  coords.map do |coord|
    x, y = coord
    matrix[y][x] = 'Q'
  end
  matrix
end

p solve_n_queens(4)

# data = [
#   [".", ".", "Q", "."], 
#   ["Q", ".", ".", "."], 
#   [".", ".", ".", "Q"], 
#   [".", ".", ".", "."]
# ]
# data = [[2,0], [0,1], [3,2]]
# p has_fight? 4, data, 1, 3
# p convert_coords_to_map(data, 4)
