require "test/unit"

class ArrayNumInc
  def self.inc(nums)
    result = nums.clone
    result[-1] += 1

    carry = false
    (result.size - 1).downto(0) do |i|
      result[i] += 1 if carry
      carry = (result[i] >= 10)
      result[i] = result[i] % 10
    end
    result.unshift 1 if carry
    result
  end
end

class TestArrayNumInc < Test::Unit::TestCase
  def test_case_1
    assert_equal ArrayNumInc.inc([1, 2, 3, 2]), [1, 2, 3, 3]
  end

  def test_case_2
    assert_equal ArrayNumInc.inc([9, 9]), [1, 0, 0]
  end

  def test_case_3
    assert_equal ArrayNumInc.inc([1, 2, 3, 9]), [1, 2, 4, 0]
  end
end
