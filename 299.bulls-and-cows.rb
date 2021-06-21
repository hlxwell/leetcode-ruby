#
# @lc app=leetcode id=299 lang=ruby
#
# [299] Bulls and Cows
#

# @lc code=start
# @param {String} secret
# @param {String} guess
# @return {String}
def get_hint(secret, guess)
  bulls = 0
  cows = 0

  secret_arr = secret.split("")
  guess_arr = guess.split("")
  unmatched_arr = []
  secret_arr.zip(guess_arr).each do |item|
    if item[0] == item[1]
      i = secret_arr.find_index(item[1])
      secret_arr.delete_at i if i
      bulls += 1
    else
      unmatched_arr << item
    end
  end

  unmatched_arr.each do |item|
    if secret_arr.include?(item[1])
      i = secret_arr.find_index(item[1])
      secret_arr.delete_at i if i
      cows += 1
    end
  end

  "#{bulls}A#{cows}B"
end

# @lc code=end
