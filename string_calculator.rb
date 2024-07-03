class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    validate_input(numbers)

    nums = extract_numbers(numbers)
    nums.sum
  end

  private

  def validate_input(input)
    raise ArgumentError, 'Invalid input' if input =~ /,\n\z/
  end

  def extract_numbers(numbers)
    numbers.split(/[\n,]/).map(&:to_i)
  end
end
