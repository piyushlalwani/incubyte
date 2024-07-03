require 'minitest/autorun'
require_relative 'string_calculator'

class StringCalculatorTest < Minitest::Test
  def test_empty_string
    calculator = StringCalculator.new
    assert_equal 0, calculator.add("")
  end

  def test_single_number
    calculator = StringCalculator.new
    assert_equal 1, calculator.add("1")
  end

  def test_two_numbers
    calculator = StringCalculator.new
    assert_equal 6, calculator.add("1,5")
  end
end
