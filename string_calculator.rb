class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    del, numbers_part = extract_del_and_numbers(numbers)

    validate_input(numbers_part)

    nums_arr = extract_numbers(numbers_part, delimiter_regex(del))
    validate_negative_numbers(nums_arr)
    nums_arr.sum
  end

  def get_called_count
    0
  end

  private

  def validate_input(input)
    raise ArgumentError, 'Invalid input' if input =~ /,\n\z/
  end

  def extract_del_and_numbers(numbers)
    if numbers.start_with?("//")
      del = numbers[2]
      numbers_part = numbers.split("\n", 2).last
    else
      del = ','
      numbers_part = numbers
    end
    [del, numbers_part]
  end

  def extract_numbers(numbers, del)
    numbers.split(del).map(&:to_i)
  end

  def delimiter_regex(delimiter)
    Regexp.new("[#{delimiter}\n]")
  end

  def validate_negative_numbers(nums)
    negatives = nums.select { |num| num.negative? }
    raise ArgumentError, "negatives numbers not allowed #{negatives.join(',')}" if negatives.any?
  end
end
