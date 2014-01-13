require_relative 'tdd-kata-1'

describe DelimeterParser do
  describe '#delimeter' do
    it 'should detect the delimeter' do
      expect(DelimeterParser.new('//;').delimeter).to eq ';'
    end
  end

  describe '#valid?' do
    it 'should return true for valid delimeter format' do
      expect(DelimeterParser.new('//?').valid?).to be_true
    end

    it 'should return false for invalid delimeter format' do
      expect(DelimeterParser.new('1,2').valid?).to be_false
    end
  end
end


describe NumberParser do
  describe '#numbers' do
    it 'should return numbers' do
      expect(NumberParser.new('1,2,3').numbers).to eq [1,2,3]
    end

    it 'should return numbers with a delimeter' do
      expect(NumberParser.new('4*5*6', '*').numbers).to eq [4,5,6]
    end

    it 'should raise error if an invalid delimeter is given' do
      expect{NumberParser.new('7,8,9', ';').numbers}.to raise_error(NumberParser::ParserError)
    end
  end
end


describe Parser do
  it 'should return numbers' do
    expect(Parser.new("//;\n10;11;12").numbers).to eq [10,11,12]
  end

  it 'should append a number before a newline if no delimeter is given' do
    expect(Parser.new("1\n2,3,4").numbers).to eq [1,2,3,4]
  end
end


describe Calculator do
  context 'positive numbers' do
    before :each do
      @calculator = Calculator.new({numbers: numbers })
    end


    context '0 integers' do
      let(:numbers) {[]}
      it 'should return 0' do
        expect(@calculator.add).to eq 0
      end
    end

    context '1 integer' do
      let(:numbers) {[1]}
      it 'should return 1' do
        expect(@calculator.add).to eq 1
      end
    end

    context '2 integers' do
      let(:numbers) {[25, 5]}
      it 'should return 30' do
        expect(@calculator.add).to eq 30
      end
    end
  end

  context 'negative numbers' do
    it 'should raise an error' do
      expect{
        calculator = Calculator.new({numbers: [10, -9, -8, 7]})
      }.to raise_error
    end
  end
end
