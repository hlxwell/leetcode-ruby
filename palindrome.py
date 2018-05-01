import math

class Solution:
    def isPalindrome(self, x):
        """
        :type x: int
        :rtype: bool
        """
        x_in_str = str(x)
        str_size = len(x_in_str)
        for i in range(0, math.floor(str_size / 2)):
          if x_in_str[i] != x_in_str[-(i+1)]: return False
        return True

if __name__ == "__main__":
  print(Solution().isPalindrome(12321))
