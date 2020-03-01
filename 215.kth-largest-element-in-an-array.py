#
# @lc app=leetcode id=215 lang=python
#
# [215] Kth Largest Element in an Array
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
import heapq
class Solution:
    def findKthLargest(self, nums, k) -> int:
      result = []
      for i in nums:
        heapq.heappush(result, i)
      return heapq.nlargest(k, result)[-1]

if __name__ == "__main__":
  s = Solution()
  print(s.findKthLargest([1, 2, -1, -9, 2, 8], 3))

# @lc code=end
