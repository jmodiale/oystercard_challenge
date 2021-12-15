require 'station'

describe Station do
    let(:station) { Station.new('Victoria', 2) }

    it 'has a name' do
        expect(station.name).to eq('Victoria')
    end

    it 'has a zone' do
        expect(station.zone).to eq(2)
    end

end