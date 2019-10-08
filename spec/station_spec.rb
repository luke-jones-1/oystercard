require 'station'

describe Station do

  it 'exposes a name' do
    station = described_class.new('Inner', 'Charring Cross')
    expect(station.name).to eq 'Charring Cross'
  end

  it 'exposes a zone' do
    station = described_class.new('Inner', 'Charring Cross')
    expect(station.zone).to eq 'Inner'
  end

end
