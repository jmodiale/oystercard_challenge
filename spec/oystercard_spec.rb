require 'oystercard'

describe Oystercard do
    let(:card) { Oystercard.new }

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
end



