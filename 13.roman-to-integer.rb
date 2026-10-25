ROMAN_TO_NUM = {
  'I' => 1,
  'V' => 5,
  'X' => 10,
  'L' => 50,
  'C' => 100,
  'D' => 500,
  'M' => 1000
}

def roman_to_int(s)
  romans = s.split('').reverse
  roman_groups = [[]]

  romans.each do |roman|
    last_group = roman_groups.last

    if (last_group.size <= 0) or (ROMAN_TO_NUM[roman] < last_group.last)
      last_group.unshift(ROMAN_TO_NUM[roman])
    else
      roman_groups.push [ROMAN_TO_NUM[roman]]
    end
  end

  roman_groups.inject(0) do |total, group|
    if group.size > 1
      total += (group.last - group.first)
    else
      total += group.last
    end
  end
end

p roman_to_int("MCMXCIV") # => 1994