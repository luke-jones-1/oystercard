require 'oystercard'

describe Oystercard do

  it 'creates empty account' do
    expect(subject.balance).to eq(0)
  end

  it 'has been topped up' do
    expect(subject).to receive(:top_up).with(20)
    subject.top_up(20)
  end

  it 'added to balance' do
    subject.top_up(20)
    expect(subject.balance).to_not eq(0)
  end

  it 'balance cap' do
    expect{subject.top_up(92)}.to raise_error "Card limit is #{Oystercard::CARD_LIMIT}"
  end

  it 'deducted from balance' do
    subject.deduct(20)
    expect(subject.balance).to eq(-20)
  end
end
