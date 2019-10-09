require 'station'

describe Station do

  it 'exposes a name' do
    station = described_class.new(1, 'Charring Cross')
    expect(station.name).to eq 'Charring Cross'
  end

  it 'exposes a zone' do
    station = described_class.new(2, 'Charring Cross')
    expect(station.zone).to eq 2
  end

end
