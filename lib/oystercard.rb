class Oystercard
    attr_reader :balance, :MAX_LIMIT, :in_journey

    MAX_LIMIT = 90

    def initialize
        @balance = 0
        @in_journey = false
    end    

    def top_up(value)
        fail 'There is a limit' if balance + value.to_i > MAX_LIMIT
        @balance += value.to_i
    end

    def deduct(value)
        @value = value
        @balance = balance - value
    end

    def in_journey?
       @in_journey
    end

    def touch_in
        @in_journey = true
    end

    def touch_out
        @in_journey = false
    end
end


