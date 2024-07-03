require 'minitest/autorun'
require_relative 'string_calculator'

class StringCalculatorTest < Minitest::Test
  def setup
    @calculator = StringCalculator.new
  end

  def test_empty_string
    assert_equal 0, @calculator.add("")
  end

  def test_single_number
    assert_equal 1, @calculator.add("1")
  end

  def test_two_numbers
    assert_equal 6, @calculator.add("1,5")
  end

  def test_multiple_numbers_returns_their_sum
    assert_equal 15, @calculator.add('1,2,3,4,5')
  end

  def test_new_lines_between_numbers_returns_their_sum
    assert_equal 6, @calculator.add("1\n2,3")
  end

  def test_add_with_custom_single_delimiter_semi_colon
    assert_equal 3, @calculator.add("//;\n1;2")
  end

  def test_add_with_custom_single_delimiter_pipe
    assert_equal 6, @calculator.add("//|\n1|2|3")
  end
end
