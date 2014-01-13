class DelimeterParser
  def initialize(text)
    @text = text
  end

  def delimeter
    @delimeter ||= ($1 if @text =~ /\/\/(.)/)
  end

  def valid?
    !delimeter.nil?
  end
end


class NumberParser
  class ParserError < RuntimeError
  end

  def initialize(text, delimeter)
    @text = text
    @delimeter = delimeter || ','
  end

  def numbers
    raise ParserError unless @text.include?(@delimeter)
    @text.split(@delimeter).map(&:to_i)
  end
end


class Parser
  def initialize(text)
    @text = text
  end

  def numbers
    nums = NumberParser.new(number_text, delimeter_parser.delimeter).numbers

    if !delimeter_parser.valid?
      nums = [first_number] + nums
    end

    nums
  end


  private

  def number_text
    @text.split("\n").last
  end

  def first_number
    @text.split("\n").first.to_i
  end

  def delimeter_parser 
    DelimeterParser.new(@text)
  end
end


class Calculator
  attr_reader :numbers

  def initialize(args)
    @numbers = args[:numbers]  #numbers is an array of integers
    check_errors
  end

  def add
    display numbers.inject(:+)
  end


  private

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

