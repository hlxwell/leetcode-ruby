require "pp"

str = "[({})[]()]"
# str = "[({})[]())]"

# # shorter
# def is_valid? str
#   while true
#     before = str.dup
#     after = str.dup.gsub(/(\{\})|(\[\])|(\(\))/, '')
#     before == after ? break : str = after
#   end
#   str.zero?
# end

# faster
def is_valid? str
  arr = str.split('')
  stack = []
  pair_table = {
    "[" => "]",
    "{" => "}",
    "(" => ")"
  }
  arr.each do |char|
    if pair_table[stack.last] == char
      stack.pop
    else
      stack.push char
    end
  end
  stack.size == 0
end

pp is_valid? str