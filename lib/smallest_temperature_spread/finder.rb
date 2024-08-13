module SmallestTemperatureSpread
  class Finder
    attr_reader :smallest_spread_day, :smallest_spread, :max, :min

    def initialize
      @smallest_spread_day = nil
      @smallest_spread = Float::INFINITY
      @max = Float::INFINITY
      @min = 0
    end

    def find(data = nil)
      data ||= yield.to_a

      data.each do |day, max_temperature, min_temperature|
        spread = max_temperature - min_temperature

        if spread < @smallest_spread
          @smallest_spread = spread
          @smallest_spread_day = day
          @max = max_temperature
          @min = min_temperature
        end
      end

      @smallest_spread_day
    end
  end
end
