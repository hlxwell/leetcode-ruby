# 26 进制问题
# 1234 % 10 = 4 ; 1234 / 10 = 123
# 123 % 10 = 3 ; 123 / 10 = 12
# 12 % 10 = 2 ; 12 / 10 = 1
# 1 % 10 = 1
# 任何进制得从0开始算
#           0..9 is 10进制
# 1..26 ==> 0..25 is 26进制
# 转化为数字的时候，0-25 => A-Z
# 2 * 26 + 0 = 52 = B? X
# 1 * 26 + 26 = 52 = AZ √
# 2 * 26 + 26 = 52 = AZ √

def convert_to_title n
  s = ''
  while n > 0
    n -= 1 # n % 26 => 0..25
    s = (n % 26 + 65).chr + s
    n = n / 26
  end
  s
end

p convert_to_title 27 # AA
p convert_to_title 26 # Z
p convert_to_title 28 # AB
p convert_to_title 72 # AZ
