require 'journey'

describe Journey do

  let(:start_station) {double :start_station, :zone => 1}
  let(:end_station) {double :end_station, :zone => 4}

  it 'starts a journey' do
    subject.start(start_station)
    expect(subject.current_journey).to include(:starting_station => start_station)
  end

  it 'ends a jounery' do
    subject.finish(end_station)
    expect(subject.current_journey).to include(:ending_station => end_station)
  end

  it 'returns min fare' do

    allow(end_station).to receive(:zone).and_return(1)

    subject.start(start_station)
    subject.finish(end_station)

    expect(subject.fare).to eq(Journey::MIN_FARE)
  end

  it 'returns penalty fare' do
    expect(subject.fare).to eq(Journey::PENALTY_FARE)
  end

  it 'returns wether journey complete' do
    expect(subject.complete?).to eq false
  end

  it 'returns proper fair' do
    subject.start(start_station)
    subject.finish(end_station)

    expect(subject.fare).to eq(4)
  end

end
