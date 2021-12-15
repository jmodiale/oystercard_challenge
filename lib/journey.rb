class journey
    
    def store_journey
        @journeys << {entry: @entry_station, exit: @exit_station}
    end
end