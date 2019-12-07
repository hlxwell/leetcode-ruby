def is_number(s)
  !!(s =~ /^\s*[+-]?((\d+\.)|(\.\d+)|(\d+\.\d+)|\d+)(e[+-]?\d+)?\s*$/)
end

{
  "0" => true,
  " 0.1 " => true,
  "abc" => false,
  "1 a" => false,
  "2e10" => true,
  " -90e3   " => true,
  " 1e" => false,
  "e3" => false,
  " 6e-1" => true,
  " 99e2.5 " => false,
  "53.5e93" => true,
  " --6 " => false,
  "-+3" => false,
  "95a54e53" => false,
  ".1" => true,
  "3." => true,
  " 000123e+98" => true,
}.each do |s, v|
  if is_number(s) != v
    puts "#{s} expected to be #{v}, but wrong."
  end
end
