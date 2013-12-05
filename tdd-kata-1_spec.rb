require_relative 'tdd-kata-1'

describe Calculator do

  context 'invalid params' do
    it 'should raise an error if param is not a string' do
      expect{ Calculator.new(1)}.to raise_error ArgumentError
    end
  end

  context 'converting string to integers' do
    let(:calculator) { Calculator.new("1,2,3") }

    it 'should split comma separated numbers into integers' do
      expect(calculator.convert.first).to be_a Integer
    end
  end

  context '#add' do
    it 'should return 0, given 0 numbers' do
      pending
    end

    it 'should return the number, given 1 number' do
      pending
    end

    it 'should return the sum, given 2 numbers' do
      pending
    end
  end

end

