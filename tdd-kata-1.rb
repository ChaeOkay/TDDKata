#parses string
#returns an array of integers

class NumberExtractor
  attr_reader :delimeter, :string_of_numbers, :numbers

  def initialize(text)
    raise ArgumentError, 'Argument is not a string' unless text.is_a? String
    format(text)
  end

  def format(text)
    new_text = text.match(/\/{2}(?<delimeter>.)\n(?<numbers>.*)/) || {}
    @string_of_numbers = new_text[:numbers] || format_newline(text)
    @delimeter = new_text[:delimeter] || ','
  end

  def numbers
    @numberes = split_numbers.map! { |number| number.to_i }
  end

  def format_newline(text)
    text.gsub('/n', ',')
  end

  def split_numbers
    string_of_numbers.split(delimeter)
  end
end


class Calculator
  attr_reader :numbers

  def initialize(numbers)
    @numbers = numbers  #numbers is an array of integers
    check_errors
  end

  def add
    display numbers.inject(:+)
  end

  def display(result)
    result.nil? ? 0 : result
  end

  def check_errors
    raise "negatives not allowed: #{negative_numbers.join(',')}" unless
      negative_numbers.empty?
  end

  def negative_numbers
    numbers.select { |number| number < 0 }
  end
end

