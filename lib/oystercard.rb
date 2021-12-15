class Oystercard
    attr_reader :balance, :MAX_LIMIT, :in_journey, :MIN_BAL, :entry_station, :journeys, :exit_station

    MAX_LIMIT = 90
    MIN_BAL = 1

    def initialize
        @balance = 0
        @in_journey = false
        @journeys = []
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
        store_journey
    end

    def store_journey
        @journeys << {entry: @entry_station, exit: @exit_station}
    end

    #private

    def deduct(value)
        @value = value
        @balance = balance - value
    end
end




