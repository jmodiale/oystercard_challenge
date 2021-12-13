class Oystercard
    attr_reader :balance, :MAX_LIMIT

    MAX_LIMIT = 90

    def initialize
        @balance = 0
    end    

    def top_up(value)
        fail 'There is a limit' if balance + value.to_i > MAX_LIMIT
        @balance += value.to_i
    end
end

