require_relative 'tdd-kata-1'

describe NumberExtractor do
  context 'invalid params' do
    it 'should raise an error if param is not a string' do
      expect{ NumberExtractor.new(1)}.to raise_error ArgumentError
    end
  end

  context 'converting string to integers' do
    it 'should convert a string into an array of numbers' do
      number = NumberExtractor.new("1,2,3")
      expect(number.collection).to eq [1,2,3]
    end

    it 'should accept /n as split points' do
      number = NumberExtractor.new("1/n3,4")
      expect(number.collection).to eq [1,3,4]
    end

    it 'should detect a new delimeter' do
      number = NumberExtractor.new("//;\n5;3;9")
      expect(number.collection).to eq [5,3,9]
    end
  end
end

describe Calculator do
  context 'positive numbers' do
    before :each do
      @calculator = Calculator.new(number.collection)
    end

    context '0 integers' do
      let(:number) { NumberExtractor.new("") }
      it 'should return 0' do
        expect(@calculator.add).to eq 0
      end
    end

    context '1 integer' do
      let(:number) { NumberExtractor.new("1") }
      it 'should return 1' do
        expect(@calculator.add).to eq 1
      end
    end

    context '2 integers' do
      let(:number) { NumberExtractor.new("25,5") }
      it 'should return 30' do
        expect(@calculator.add).to eq 30
      end
    end
  end

  context 'negative numbers' do
    it 'should raise an error' do
      expect{
        number = NumberExtractor.new("10,-9,-8,7")
        calculator = Calculator.new(number.collection)
      }.to raise_error
    end
  end
end
