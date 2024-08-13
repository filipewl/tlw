module SmallestTemperatureSpread
  class DataParser
    DATA_LINE_NUMBER = 6
    END_DELIMITER = "</pre>"

    def initialize(input)
      @input = input
    end

    def parse
      io = @input.is_a?(String) ? File.open(@input) : @input

      Enumerator.new do |yielder|
        io.each_line.with_index do |line, index|
          next if index < DATA_LINE_NUMBER

          columns = line.split
          next if columns.empty? || columns.include?(END_DELIMITER)

          day = columns[0].to_i
          max_temperature = columns[1].to_i
          min_temperature = columns[2].to_i

          yielder << [day, max_temperature, min_temperature]
        end
      end
    end
  end
end
