require "rspec"

require_relative "../../lib/smallest_temperature_spread/finder"

RSpec.describe SmallestTemperatureSpread::Finder do
  describe "#find" do
    it "accepts an array with the data of days, max, min temperatures, and finds the day with smallest spread" do
      data = [
        [1, 88, 59], # 88 - 59 = 29
        [2, 79, 63] # 79 - 63 = 16 * smallest
      ]

      finder = SmallestTemperatureSpread::Finder.new
      finder.find(data)

      expect(finder.smallest_spread_day).to eq(2)
      expect(finder.smallest_spread).to eq(16)
    end

    it "also accepts an enumerator with the data" do
      data = Enumerator.new do |yielder|
        yielder << [1, 77, 59] # 77 - 59 = 18 * smallest
        yielder << [2, 77, 55] # 77 - 55 = 22
      end

      finder = SmallestTemperatureSpread::Finder.new
      finder.find { data }

      expect(finder.smallest_spread_day).to eq(1)
      expect(finder.smallest_spread).to eq(18)
    end
  end
end
