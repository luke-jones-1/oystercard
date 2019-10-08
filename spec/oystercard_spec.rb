require 'oystercard'

describe Oystercard do

  describe '#initialize' do

    it 'creates empty account' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#top_up' do

    it 'balance cap' do
      expect{subject.top_up(92)}.to raise_error "Card limit is £#{Oystercard::CARD_MAX_LIMIT}"
    end

    it 'has been topped up' do
      expect(subject).to receive(:top_up).with(20)
      subject.top_up(20)
    end

    it 'added to balance' do
      subject.top_up(20)
      expect(subject.balance).to_not eq(0)
    end
  end

  describe '#deduct' do

    it 'raises an error when balance is below fare' do
      expect{subject.touch_out}.to raise_error "insufficient funds £#{Oystercard::CARD_MIN_LIMIT}"
    end

    it 'deducted from balance' do
      subject.top_up(30)
      subject.touch_out
      expect(subject.balance).to eq(24)
    end
  end

  #journey

  describe '#touch_in' do

    it { is_expected.to respond_to(:touch_in) }

    it 'is active after touch in' do
      subject.touch_in("Charring Cross")
      expect(subject.in_journey?).to eq true
    end
  end

  describe '#touch_out' do

    it { is_expected.to respond_to(:touch_out) }

    it 'is inactive after touch out' do

      subject.top_up(20)


      expect {subject.touch_out}.to change{subject.balance}.by(-6)
      expect(subject.in_journey?).to eq true
    end
  end

  describe '#in_journey' do

    it { is_expected.to respond_to(:in_journey?) }

  end
end
