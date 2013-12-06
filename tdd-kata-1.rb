class Number
  attr_reader :text, :delimeter, :numbers

  def initialize(text)
    raise ArgumentError, 'Argument is not a string' unless text.is_a? String
    format(text)
  end

  def collection
    numbers.split(delimeter).map! { |number| number.to_i }
  end

  def format(text)
    new_text = text.match(/\/{2}(?<delimeter>.)\n(?<numbers>.*)/) || {}
    @numbers = new_text[:numbers] || format_newline(text)
    @delimeter = new_text[:delimeter] || ','
  end

  def format_newline(text)
    text.gsub('/n', ',')
  end

  def check_for_negative_numbers
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

number = Number.new("1,2,3")
number.collection

