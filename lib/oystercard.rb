class Oystercard
    attr_reader :balance, :MAX_LIMIT, :in_journey, :MIN_BAL, :entry_station, :exit_station

    MAX_LIMIT = 90
    MIN_BAL = 1

    def initialize
        @balance = 0
        @in_journey = false
    end    

    def top_up(value)
        fail 'There is a limit' if balance + value.to_i > MAX_LIMIT
        @balance += value.to_i
    end

    def in_journey?
       @entry_station
    end

    def touch_in(station)
        fail 'Balance is less than £1' if  balance < MIN_BAL
        @entry_station = station
    end

    def touch_out(station)
        deduct(MIN_BAL)
        @entry_station = nil
        @exit_station = station
    end
    #private

    def deduct(value)
        @value = value
        @balance = balance - value
    end
end




