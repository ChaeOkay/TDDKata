class Number
  attr_reader :text

  def initialize(text)
    raise ArgumentError, 'Argument is not a string' unless text.is_a? String
    @text = text
  end

  def collection
    text.split(',').map! { |number| number.to_i }
  end
end


class Calculator
  attr_reader :numbers

  def initialize(numbers)
    @numbers = numbers
  end

  def add
    display numbers.inject(:+)
  end

  def display(result)
    return 0 if result.nil?
    result
  end
end

