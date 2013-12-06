class Number
  attr_reader :text

  def initialize(text)
    raise ArgumentError, 'Argument is not a string' unless text.is_a? String
    @text = text
  end

  def collection
    standardize.split(',').map! { |number| number.to_i }
  end

  def standardize
    text.gsub('/n', ',')
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
    result.nil? ? 0 : result
  end
end

