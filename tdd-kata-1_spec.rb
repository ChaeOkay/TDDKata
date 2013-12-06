require_relative 'tdd-kata-1'

describe Number do
  context 'invalid params' do
    it 'should raise an error if param is not a string' do
      expect{ Number.new(1)}.to raise_error ArgumentError
    end
  end

  context 'converting string to integers' do
    it 'should convert a string into an array of numbers' do
      number = Number.new("1,2,3")
      expect(number.collection).to eq [1,2,3]
    end

    it 'should accept /n as split points' do
      number = Number.new("1/n3,4")
      expect(number.collection).to eq [1,3,4]
    end
  end
end

describe Calculator do
  before :each do
    @calculator = Calculator.new(number.collection)
  end

  context 'given 0 numbers' do
    let(:number) { Number.new("") }
    it 'should return 0' do
      expect(@calculator.add).to eq 0
    end
  end

  context 'given 1 number' do
    let(:number) { Number.new("1") }
    it 'should return 1' do
      expect(@calculator.add).to eq 1
    end
  end

  context 'given 2 numbers' do
    let(:number) { Number.new("25,5") }
    it 'should return 30' do
      expect(@calculator.add).to eq 30
    end
  end
end
