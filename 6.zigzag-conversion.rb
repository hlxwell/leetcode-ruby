require "benchmark"

### O(n^2)
# def convert(s, num_rows)
#   return s if num_rows == 1
#   result = ""
#   matrix = []
#   str_arr = s.split ''
#   row_index = 0
#   unit_size = num_rows - 1
#   while str_arr.size > 0
#     matrix << Array.new(num_rows, nil)
#     unit_row_index = row_index % unit_size
#     (num_rows - 1).downto(0) do |col_index|
#       if unit_row_index == 0 || col_index == unit_row_index
#         matrix[row_index][col_index] = str_arr.shift
#       end
#     end
#     row_index += 1
#   end
#   (num_rows - 1).downto(0) do |row_index|
#     0.upto(matrix.size - 1).each do |col_index|
#       result << matrix[col_index][row_index] if matrix[col_index][row_index]
#     end
#   end
#   result
# end

def convert(s, num_rows)
  return s if num_rows == 1
  result = ""
  unit = num_rows > 2 ? (num_rows - 1) * 2 : num_rows
  num_rows.times do |row_index|
    char_index = row_index
    while char_index < s.size
      result << s[char_index]
      # row != 0 || row != last row => add get char at (unit - 2 * row_index)
      middle_char_index = char_index + (unit - 2 * row_index)
      if unit != 2 * row_index && row_index != 0 && middle_char_index < s.size
        result << s[middle_char_index]
      end
      char_index += unit
    end
  end
  result
end

p convert "PAYPALISHIRING", 4
p convert "ABCD", 3
p convert "ABC", 2
p convert "AB", 1
# p convert "lqcmkyiazbwqpbqhbkjioqxslhosdqvogxcsxmtxqppfsgmtqxegpdzakpunfpdmpiemwxlmpbsjhgfzelhtoiwyyqndisrzcylzxxloafyjmfisqrngajgactdknvjqvwrsvehvkheyooqegdkipsirnnbakmsfijyeohbyqgyewoketumimwzbkcbuouczfcftjgtzorflhprdlglzcnaorblgxnhdrmyausblliwvxpyivljayjoqmbykqhphvnjphmatuyqrooblzklatcsgfsswzhfuwpledozyopreftqeddgzfyhlqzjriongfzmjpnjdeakjtcqzfwylxhypihhsxuyfvnomaxqfxcqtegsjfswezuthdczbzzgumwhpvzuubmnhtfqazpeyjxhpcgsbiavuyejtdfngsdnnkgpkvtigsqxuypvgrtdpxoidwylqbzdnhsxengmfykcwbxftqiioyttutekwfpjmjhqwnfenpglqdqjwaumbnfvgjicrxldjswfhblwsriixauvdohedozjzjnqjawsvszevlbnejxdlryofhsivutxfgnojjgedgiatjpxunbgebwmjrwgnsdsathjepnivwkqhaocprktuihdzgmoyrhykqkphxzfvlvfljjacvwxdfcflotlicksuwjcvihrucyhohiscgphlumzkikskwlhswjofshbwfkmosfsawboqondyxvkuirofcemulntsxfismaujeibsvesvccpkufpykdvxsoqqvakidgthpwbmdthfvyrrejqomnlfbdxyejghpbqearrdkaihzbzdkrtxegehmbfqmozbpripibusbezagafqtypzhtgtwmlickmtbullvfdykezshekcfacmvifuwqcycosfkdqfkvgwbfok", 340

