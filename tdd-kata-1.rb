class Number
  attr_reader :text, :delimeter

  def initialize(text)
    raise ArgumentError, 'Argument is not a string' unless text.is_a? String
    @text = text
    @delimeter = ','
  end

  def collection
    detect_delimeter.split(delimeter).map! { |number| number.to_i }
  end

  def standardize
    text.gsub('/n', ',')
  end

  def detect_delimeter
    new_text = text.match(/\/{2}(?<delimeter>.)\n(?<numbers>.*)/)
    if new_text
      @delimeter = new_text[:delimeter]
      @text = new_text[:numbers]
    else
      standardize
    end
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

