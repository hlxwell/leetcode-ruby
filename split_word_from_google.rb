# Split word by space, but not affect those words with in quota.

require "pp"

def split_by_space(str)
  return [] if str.empty?
  result = [""]
  in_quota = false

  0.upto(str.size - 1) do |i|
    if str[i] == " " and !in_quota
      result << ""
    else
      result[result.size - 1] << str[i]
    end

    if str[i] == '"'
      in_quota = !in_quota
      if !in_quota and str[i + 1] != " "
        result << ""
      end
    end
  end

  result
end

pp split_by_space 'aa "bb cc dd" ee'
pp split_by_space 'aa "bb ee'
pp split_by_space 'aa "bb" ee'
pp split_by_space 'aa "bb "ee'
