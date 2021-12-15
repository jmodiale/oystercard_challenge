require 'oystercard'

describe Oystercard do
    let(:card) { Oystercard.new }
    let(:station){ double(:station) }

    it 'balance default is 0' do
        expect(card.balance).to eq(0)
    end

    it { is_expected.to respond_to(:top_up).with(1).argument}

    it 'balance increases value' do
      card.balance
      expect { card.top_up 1 }.to change{ card.balance }.by 1
    end

    it 'raises an error when above limit' do
        max_limit = card.MAX_LIMIT
        card.top_up(max_limit)
       expect { card.top_up 1}.not_to raise_error 'There is a limit'
    end

    it { is_expected.to respond_to(:deduct).with(1).argument}

    it 'deducts money from balance' do
        card.balance
        expect { card.deduct 1 }.to change{ card.balance }.by -1
    end

    it 'is in a journey' do
        expect(card).not_to be_in_journey
    end

    it 'taps in' do
        card.top_up(Oystercard::MAX_LIMIT)
        card.touch_in(station)
        expect(card).to be_in_journey
    end

    it 'taps out' do
        card.touch_out(station)
        expect(card).not_to be_in_journey
    end

    it 'raises an error when less than minimum balance' do
        card.deduct(Oystercard::MIN_BAL)
        expect{card.touch_in station}.not_to raise_error 'Balance less than £1'
    end

    it 'checks the card was charged on touchout' do
        card.top_up(Oystercard::MIN_BAL)
        card.touch_in(station)
        expect{ card.touch_out station}.to change{ card.balance }.by(-Oystercard::MIN_BAL)
    end

    it 'remembers the entry station after touch in' do
        card.top_up(Oystercard::MIN_BAL)
        card.touch_in(station)
        expect(card.entry_station).to eq station
    end

    it 'forgets the station' do
        card.top_up(Oystercard::MIN_BAL)
        card.touch_out(station)
        expect(card.entry_station).to eq nil
    end
end


# card.deduct(Oystercard::MIN_BAL)
# min_limit = card.MIN_BAL
# card.top_up(min_limit)




