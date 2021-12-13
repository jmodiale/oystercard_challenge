require 'oystercard'

describe Oystercard do
    let(:card) { Oystercard.new }

    it 'balance default is 0' do
        expect(card.balance).to eq(0)
    end

    it { is_expected.to respond_to(:top_up).with(1).argument}

    it 'balance increases value' do
      card.balance
      expect { card.top_up 40 }.to change{ card.balance }.by 40
    end
end

