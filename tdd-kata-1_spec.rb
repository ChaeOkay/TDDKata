require_relative 'tdd-kata-1'

describe Calculator do
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

describe Number do
  context 'invalid params' do
    it 'should raise an error if param is not a string' do
      expect{ Number.new(1)}.to raise_error ArgumentError
    end
  end

  context 'converting string to integers' do
    let(:number) { Number.new("1,2,3") }

    it 'should convert a string into an array of numbers' do
      expect(number.collection).to eq [1,2,3]
    end
  end
end
