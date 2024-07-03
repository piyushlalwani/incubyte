require 'minitest/autorun'
require_relative 'string_calculator'

class StringCalculatorTest < Minitest::Test
  def setup
    @calculator = StringCalculator.new
  end

  def test_get_called_count_returns_zero_when_not_called
    assert_equal 0, @calculator.get_called_count
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

  def test_negative_numbers_should_raises_error
    assert_raises(ArgumentError, 'negatives numbers not allowed -2') do
      @calculator.add("1,-2")
    end
  end

  def test_add_multiple_negative_numbers_should_raises_error
    assert_raises(ArgumentError, 'negatives numbers not allowed -2,-3') do
      @calculator.add("1,-2,-3,4")
    end
  end

  def test_get_called_count_returns_correct_count_after_add_calls
    @lcal = StringCalculator.new
    @lcal.add("")
    @lcal.add("1")
    assert_equal 2, @lcal.get_called_count
  end

  def test_ignore_numbers_greater_than_1000
    assert_equal 2, @calculator.add('2,1001')
  end

  def test_with_custom_delimiter_of_any_length
    assert_equal 5, @calculator.add("//[***]\n1***4***0")
  end

  def test_add_with_multiple_delimiters
    assert_equal 6, @calculator.add("//[*][%]\n1*2%3")
  end

  def test_add_with_multiple_delimiters_with_length_more_than_one
    assert_equal 6, @calculator.add("//[**][%%]\n1**2%%3")
  end
end
