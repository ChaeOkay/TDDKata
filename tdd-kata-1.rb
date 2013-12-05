class Calculator

  attr_accessor :numbers
  def initialize(numbers)
    raise ArgumentError, 'Argument is not a string' unless numbers.is_a? String
    @numbers = numbers
  end
end
