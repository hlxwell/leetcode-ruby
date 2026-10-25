require 'pp'

# Toeplitz Matrix
# matrix = [
#       [1,2,3,4],
#     [5,1,2,3],
#   [9,5,1,2]
# ]

# matrix = [
#         [1,2,3],
#       [5,1,2],
#     [9,5,1],
#   [8,9,5]
# ]

matrix = [[84]]

def is_toeplitz_matrix matrix
  row_count = matrix.size
  col_count = matrix[0].size
  return true if row_count <= 1 || col_count <= 1

  # recursive for the rows
  matrix.each_with_index do |row, row_index|
    next if row_index == 0 # skip the first row

    row.each_with_index do |col, col_index|
      next if col_index == 0
      return false if col != matrix[row_index - 1][col_index - 1]
    end
  end

  true
end

pp is_toeplitz_matrix matrix