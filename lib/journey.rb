class Journey
    attr_reader :journeys, :entry_station, :exit_station

    PENALTY_FARE = 6
    MIN_FARE = 2
    
    def initialize
        @journeys = []
    end

    def start(entry_station)
        @entry_station = entry_station
    end

    def fare
        if (!entry_station || !exit_station)
            return PENALTY_FARE
        end
    end

    def end(exit_station)
        @exit_station = exit_station
        store_journey
    end

    def store_journey
        @journeys << {entry: @entry_station, exit: @exit_station}
    end
end

journey = Journey.new
p journey.fare