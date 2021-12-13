require 'oystercard'

describe Oystercard do
    let(:card) { Oystercard.new }

    it 'balance default is 0' do
        expect(card.balance).to eq(0)
    end
end

