require 'journey_log'

describe JourneyLog do

  let(:journey) {double :journey, complete?: false }

  it 'raises an error if journey is not complete' do
    expect { subject.add_journey(journey) }.to raise_error 'journey not complete'
  end

  it 'adds complete journeys to an array' do
    allow(journey).to receive(:complete?).and_return true
    allow(journey).to receive(:current_journey).and_return journey
    subject.add_journey(journey)
    expect(subject.journeys).to include journey
  end

end
