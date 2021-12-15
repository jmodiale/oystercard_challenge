require 'journey'
require 'oystercard'

describe Journey do
    let(:entry_station) { double :station}
    let(:exit_station) { double :station}

    it 'journey list to be empty by default' do
        expect(subject.journeys).to be_empty
    end

    it 'checks if journey is created' do
        subject.start(entry_station)
        subject.end(exit_station)
        expect(subject.journeys.count).to eq 1
    end
end