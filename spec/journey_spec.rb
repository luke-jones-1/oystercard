require 'journey'

describe Journey do

  describe '#touch_in' do

    it { is_expected.to respond_to(:touch_in) }

    it 'is active after touch in' do
      subject.touch_in
      expect(subject.in_journey).to eq true
    end

  end

  describe '#touch_out' do

    it { is_expected.to respond_to(:touch_out) }

    it 'is inactive after touch out' do
      subject.touch_out
      expect(subject.in_journey).to eq false
    end

  end

  describe '#in_journey' do

    it { is_expected.to respond_to(:in_journey) }

  end

end
