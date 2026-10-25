def unique_paths(cols, rows)
  return 0 if rows == 0 && cols == 0
  return 1 if cols == 1 || rows == 1

  result = [[1] * cols]

  1.upto(rows - 1) do |i|
    result << [1]
    1.upto(cols - 1) do |j|
      result[i][j] = result[i][j - 1] + result[i - 1][j]
    end
  end

  result.last.last
end

p unique_paths(5, 5)