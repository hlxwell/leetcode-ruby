require "pp"
require 'benchmark'

def hamming_distance(x, y)
  x_bi = x.to_s(2)
  y_bi = y.to_s(2)

  max_length = (x > y ? x_bi.size : y_bi.size)

  x_bi = x_bi.rjust(max_length, '0')
  y_bi = y_bi.rjust(max_length, '0')

  zipped_chars = x_bi.split('').zip y_bi.split('')
  zipped_chars.count do |pair|
    pair.first != pair.last
  end
end

def hamming_distance x, y
  (x ^ y).to_s(2).count('1')
end

pp hamming_distance 5, 10