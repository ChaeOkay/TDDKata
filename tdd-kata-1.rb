class Calculator
end


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
