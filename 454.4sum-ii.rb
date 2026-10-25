require 'pp'

# 1. (0, 0, 0, 1) -> A[0] + B[0] + C[0] + D[1] = 1 + (-2) + (-1) + 2 = 0
# 2. (1, 1, 0, 0) -> A[1] + B[1] + C[0] + D[0] = 2 + (-1) + (-1) + 0 = 0

a = [ 1, 2]
b = [-2,-1]
c = [-1, 2]
d = [ 0, 2]

# a = [0] * 10
# b = [0] * 10
# c = [0] * 10
# d = [0] * 10

def four_sum_count(a, b, c, d)
  result = 0
  cached_ab_sum = {}
  0.upto(a.size - 1) do |pa|
    0.upto(b.size - 1) do |pb|
      cached_ab_sum[a[pa] + b[pb]] ||= []
      cached_ab_sum[a[pa] + b[pb]] << [pa, pb]
    end
  end

  0.upto(c.size - 1) do |pc|
    0.upto(d.size - 1) do |pd|
      findings = cached_ab_sum[-(c[pc] + d[pd])]
      result += findings.size if findings
    end
  end

  result
end

pp four_sum_count a, b, c, d
