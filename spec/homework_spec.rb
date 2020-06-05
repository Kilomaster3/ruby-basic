# frozen_string_literal: true

require './homework'

describe '#validate' do
  context 'license key length' do
    context 'when > 16 digits' do
      it 'returns false' do
        expect(validate(53_082_075_408_853_231)).to eq false
      end
    end

    context 'when < 16 digits' do
      it 'returns false' do
        expect(validate(53_082_075_408_853)).to eq false
      end
    end
  end

  context 'first two digits of license key' do
    [4_169_294_814_153_321, 0o244403223651176, 1_364_967_124_577_676, 5_036_402_220_169_339,
     8_539_470_583_285_584].each do |key|
      it 'returns false' do
        expect(validate(key)).to eq false
      end
    end
  end

  context 'checksum' do
    [5_169_294_814_153_321, 5_244_403_223_651_176, 5_364_967_124_577_676,
     5_436_402_220_169_339, 5_539_470_583_285_584].each do |key|
      it 'returns true' do
        expect(validate(key)).to eq true
      end
    end
  end
end
