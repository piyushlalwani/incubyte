class StringCalculator
  def initialize
    @called_count = 0
  end

  def add(numbers)
    @called_count += 1

    return 0 if numbers.empty?

    del, numbers_part = extract_del_and_numbers(numbers)

    validate_input(numbers_part)

    nums_arr = extract_numbers(numbers_part, delimiter_regex(del))
    validate_negative_numbers(nums_arr)

    nums_arr.reject! { |num| num > 1000 } # Ignore numbers larger than 1000

    nums_arr.sum
  end

  def get_called_count
    @called_count
  end

  private

  def validate_input(input)
    raise ArgumentError, 'Invalid input' if input =~ /,\n\z/
  end

  def extract_del_and_numbers(numbers)
    if numbers.start_with?("//")
      splitted_string = numbers.split("\n", 2)
      del = process_delimitters(splitted_string.first)
      numbers_part = splitted_string.last
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
    Regexp.new("[#{Regexp.escape(delimiter)}\n]")
  end

  def validate_negative_numbers(nums)
    negatives = nums.select { |num| num.negative? }
    raise ArgumentError, "negatives numbers not allowed #{negatives.join(',')}" if negatives.any?
  end

  def process_delimitters(del_str)
    return del_str[2] if del_str[2..].match(/\[.*\]/).nil?

    del_str.match(/\[([^\[\]]+)\]/)[1]
  end
end
