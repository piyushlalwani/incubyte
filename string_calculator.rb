class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    
    nums = numbers.split(',').map(&:to_i)
    nums.sum
  end
end
