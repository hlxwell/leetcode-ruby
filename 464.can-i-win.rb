def predict_the_winner(nums)
  calculateBestScore(nums, 0, nums.size - 1) >= 0
end

# [
#   i - (i+1..j),
#   j - (i..j-1)
# ].max
#
def calculateBestScore nums, i, j
  return nums[i] if i == j

  first = nums[i] - calculateBestScore(nums, i + 1, j)
  last = nums[j] - calculateBestScore(nums, i, j - 1)
  [first, last].max
end

p predict_the_winner [1, 5, 2, 1]
p predict_the_winner [1, 5, 233, 7]
p predict_the_winner [1, 5, 2]
p predict_the_winner [1, 567, 1, 1]
p predict_the_winner [0]
p predict_the_winner [1000, 999, 999, 1000, 555, 400]
p predict_the_winner [3606449,6,5,9,452429,7,9580316,9857582,8514433,9,6,6614512,753594,5474165,4,2697293,8,7,1]
