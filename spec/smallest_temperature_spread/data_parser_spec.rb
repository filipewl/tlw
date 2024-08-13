require "rspec"

require_relative "../../lib/smallest_temperature_spread/data_parser"

RSpec.describe SmallestTemperatureSpread::DataParser do
  it "parses a .dat file and yields the day, max temperature, and minimum temperature data" do
    file_content = <<~DATA

      <pre>
      MMU June 2002

        Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP

        1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5
        2  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5
      </pre>

    DATA

    io = StringIO.new(file_content)
    parser = SmallestTemperatureSpread::DataParser.new(io)
    rows = parser.parse.to_a

    expect(rows).to eq([
      [1, 88, 59],
      [2, 79, 63]
    ])
  end
end
